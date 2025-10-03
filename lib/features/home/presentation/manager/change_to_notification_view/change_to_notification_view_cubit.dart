
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_to_notification_view_state.dart';

class ChangeToNotificationViewCubit extends Cubit<int> {
  ChangeToNotificationViewCubit() : super(0);

  void changeIndex(int index) {
    emit(index);
  }
}
