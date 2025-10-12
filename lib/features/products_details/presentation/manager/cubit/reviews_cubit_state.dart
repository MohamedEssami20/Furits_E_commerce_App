part of 'reviews_cubit_cubit.dart';

sealed class ReviewsCubitState extends Equatable {
  const ReviewsCubitState();

  @override
  List<Object> get props => [];
}

final class ReviewsCubitInitial extends ReviewsCubitState {}

// create all state of add comments;
final class AddCommentLoading extends ReviewsCubitState {}

final class AddCommentSuccess extends ReviewsCubitState {}

final class AddCommentFailure extends ReviewsCubitState {
  final String errormessage;
  const AddCommentFailure({required this.errormessage});
}
