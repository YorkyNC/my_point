import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_bloc.freezed.dart';
part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc() : super(_Initial()) {
    on<ReviewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
