import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../main.dart';

import '../context/context_activity_bloc.dart';

abstract class BaseCubit<S> extends Cubit<S> {
  BaseCubit(super.initialState);
  ContextActivityBloc? contextActivity;

  void withContextHandler(ContextActivityBloc contextActivityBloc) {
    contextActivity = contextActivityBloc;
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    log.e('CubitError: ${error.toString()}');
    super.onError(error, stackTrace);
  }
}
