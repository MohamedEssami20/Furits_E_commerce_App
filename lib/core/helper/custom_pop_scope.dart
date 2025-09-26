import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/presentation/manager/profile_view_cubit/profile_view_cubit.dart';

class CustomPopScope extends StatelessWidget {
  const CustomPopScope({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        context.read<ProfileViewCubit>().changeIndex(0);
      },
      child: child,
    );
  }
}
