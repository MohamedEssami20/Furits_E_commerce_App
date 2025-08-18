import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'profile_view_state.dart';

class ProfileViewCubit extends Cubit<int> {
  ProfileViewCubit() : super(0);

  int index = 0;
  void changeIndex(int newIndex) {
    index = newIndex;
    emit(index);
  }
}
