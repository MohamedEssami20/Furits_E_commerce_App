import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';
import 'package:fruits_hub/features/home/domain/repos/home_repo.dart';

part 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit({required this.homeRepo}) : super(GetUserInitial());

  final HomeRepo homeRepo;

  // create method that get user data
  Future<void> getUserData() async {
    emit(GetUserLoading());
    final result = await homeRepo.getUserData();
    result.fold(
      (failure) => emit(
        GetUserFailure(errorMessage: failure.errorMessage),
      ),
      (user) => emit(
        GetUserSuccess(user: user),
      ),
    );
  }
}
