import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'enum/network_check_state_enum.dart';

class NetworkStatusNotifier extends ChangeNotifier {
  bool _hasConnection = true;
  NetworkCheckStateEnum _checkState = NetworkCheckStateEnum.initial;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _subscription;
  Timer? _stateResetTimer;

  bool get hasConnection => _hasConnection;
  NetworkCheckStateEnum get checkState => _checkState;

  NetworkStatusNotifier() {
    _initConnectivity();
    _subscription = _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> results) {
      _updateConnectionStatus(results);
    });
  }

  Future<void> checkConnectivity() async {
    _checkState = NetworkCheckStateEnum.checking;
    notifyListeners();

    try {
      final results = await _connectivity.checkConnectivity();
      final hasConnection = results.any((result) => result != ConnectivityResult.none);

      _checkState = hasConnection ? NetworkCheckStateEnum.success : NetworkCheckStateEnum.failure;
      _hasConnection = hasConnection;
      notifyListeners();

      _stateResetTimer?.cancel();
      _stateResetTimer = Timer(const Duration(seconds: 2), () {
        if (!_hasConnection &&
            (_checkState == NetworkCheckStateEnum.success || _checkState == NetworkCheckStateEnum.failure)) {
          _checkState = NetworkCheckStateEnum.initial;
          notifyListeners();
        }
      });
    } on PlatformException catch (_) {
      _hasConnection = false;
      _checkState = NetworkCheckStateEnum.failure;
      notifyListeners();

      _stateResetTimer?.cancel();
      _stateResetTimer = Timer(const Duration(seconds: 2), () {
        _checkState = NetworkCheckStateEnum.initial;
        notifyListeners();
      });
    }
  }

  Future<void> _initConnectivity() async {
    try {
      final results = await _connectivity.checkConnectivity();
      _updateConnectionStatus(results);
    } on PlatformException catch (_) {
      _hasConnection = false;
      notifyListeners();
    }
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    _hasConnection = results.any((result) => result != ConnectivityResult.none);
    _checkState = NetworkCheckStateEnum.initial;
    notifyListeners();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _stateResetTimer?.cancel();
    super.dispose();
  }
}
