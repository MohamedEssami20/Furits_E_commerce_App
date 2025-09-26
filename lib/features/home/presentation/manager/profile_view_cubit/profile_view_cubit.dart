import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'profile_view_state.dart';

class ProfileViewCubit extends Cubit<int> {
  ProfileViewCubit() : super(0);

  int index = -1;

  @override
  int get state {
    log("Inside ProfileViewCubit.state getter, current state = ${super.state}");
    return super.state;
  }

  void changeIndex(int newIndex) {
    index = newIndex;
    log("index in ProfileViewCubit = $index");
    emit(index);
  }
}
