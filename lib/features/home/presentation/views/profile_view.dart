import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/features/home/presentation/manager/profile_view_cubit/profile_view_cubit.dart';

import '../../domain/repos/home_repo.dart';
import '../manager/get_user_cubit/get_user_cubit.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetUserCubit(
            homeRepo: getIt.get<HomeRepo>(),
          )..getUserData(),
        ),
        BlocProvider(
          create: (context) => ProfileViewCubit(),
        ),
      ],
      child: const SafeArea(
        child: ProfileViewBody(),
      ),
    );
  }
}
