import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_pvz_event.dart';
part 'register_pvz_state.dart';
part 'register_pvz_bloc.freezed.dart';

class RegisterPvzBloc extends Bloc<RegisterPvzEvent, RegisterPvzState> {
  RegisterPvzBloc() : super(_Initial()) {
    on<RegisterPvzEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
