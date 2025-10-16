import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/products_details/domain/repos/reviews_repos.dart';

part 'get_percent_rating_state.dart';

class GetPercentRatingCubit extends Cubit<GetPercentRatingState> {
  GetPercentRatingCubit({required this.reviewsRepos})
      : super(GetPercentRatingInitial());

  final ReviewsRepos reviewsRepos;
  StreamSubscription? _streamSubscription;

  // create method that get all percent ratings;
  void getPercentRatings({required String productId}) async {
    emit(GetAllPercentRatingLoading());
    _streamSubscription = reviewsRepos
        .getPercentageOfAllBarsOfRating(productId: productId)
        .listen((event) {
      event.fold(
        (l) => emit(
          GetAllPercentRatingFailure(errorMessage: l.errorMessage),
        ),
        (r) => emit(
          GetAllPercentRatingSuccess(percentageOfAllBarsOfRating: r),
        ),
      );
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
