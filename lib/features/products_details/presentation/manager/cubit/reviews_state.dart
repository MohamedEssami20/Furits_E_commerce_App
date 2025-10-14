part of 'reviews_cubit.dart';

sealed class ReviewsState extends Equatable {
  const ReviewsState();

  @override
  List<Object> get props => [];
}

final class ReviewsCubitInitial extends ReviewsState {}

// create all state of add comments;
final class AddCommentLoading extends ReviewsState {}

final class AddCommentSuccess extends ReviewsState {}

final class AddCommentFailure extends ReviewsState {
  final String errormessage;
  const AddCommentFailure({required this.errormessage});
}

// create all method that get all reviwes;

final class GetReviewsSuccess extends ReviewsState {
  final List<UserReviewEntity> reviewsList;
  const GetReviewsSuccess({required this.reviewsList});
}

final class GetReviewsFailure extends ReviewsState {
  final String errormessage;
  const GetReviewsFailure({required this.errormessage});
}

final class GetReviewsLoading extends ReviewsState {}
