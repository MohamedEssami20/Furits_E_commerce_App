import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home/domain/repos/home_repo.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit(this.homeRepo) : super(SignOutInitial());

  final HomeRepo homeRepo;


  // create methodt that signout user
 Future< void> signOut() async {
    emit(SignOutLoading());
    final result = await homeRepo.signOut();
    result.fold(
      (failure) => emit(SignOutFailure(errorMessage: failure.errorMessage)),
      (_) => emit(SignOutSuccess()),
    );
  }
}
