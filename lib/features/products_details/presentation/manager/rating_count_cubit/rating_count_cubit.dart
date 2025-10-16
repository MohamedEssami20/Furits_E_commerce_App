
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rating_count_state.dart';

class RatingCountCubit extends Cubit<int> {
  RatingCountCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
  
  int currentRating = 0;
  void setCurrentRating(int rating) {
    currentRating = rating;
    emit(rating);
  }

  getCurrentRating() => currentRating;
}
