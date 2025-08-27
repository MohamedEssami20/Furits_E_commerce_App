import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';
import 'package:fruits_hub/features/home/domain/repos/home_repo.dart';

part 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit({required this.homeRepo}) : super(GetUserInitial());

  final HomeRepo homeRepo;
  StreamSubscription? _streamSubscription;
  //create get userEntity;
  UserEntity? userEntity;

  // create stream metod that get user;
  void getUserData() {
    emit(GetUserLoading());
    _streamSubscription = homeRepo.getUserData().listen((event) {
      event.fold(
        (failure) => emit(GetUserFailure(errorMessage: failure.errorMessage)),
        (user) {
          userEntity = user;
          emit(
            GetUserSuccess(user: user),
          );
        },
      );
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
