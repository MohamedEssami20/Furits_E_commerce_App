
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<int> {
  WalletCubit() : super(0);

  int index = 0;
  void changeIndex(int newIndex) {
    index = newIndex;
    emit(index);
  }
}
