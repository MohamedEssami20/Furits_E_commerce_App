import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'detais_and_reviews_state.dart';

class DetailsAndReviewsCubit extends Cubit<int> {
  DetailsAndReviewsCubit() : super(0);

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(currentIndex);
  }
}
