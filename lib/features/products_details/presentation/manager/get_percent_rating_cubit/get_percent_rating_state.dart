part of 'get_percent_rating_cubit.dart';

sealed class GetPercentRatingState extends Equatable {
  const GetPercentRatingState();

  @override
  List<Object> get props => [];
}

final class GetPercentRatingInitial extends GetPercentRatingState {}

//create all state of get all percent ratings;
final class GetAllPercentRatingSuccess extends GetPercentRatingState {
  final Map<int, double> percentageOfAllBarsOfRating;
  const GetAllPercentRatingSuccess({required this.percentageOfAllBarsOfRating});
}

final class GetAllPercentRatingFailure extends GetPercentRatingState {
  final String errorMessage;
  const GetAllPercentRatingFailure({required this.errorMessage});
}

final class GetAllPercentRatingLoading extends GetPercentRatingState {}
