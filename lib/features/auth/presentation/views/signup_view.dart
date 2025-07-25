import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/manager/signup_cubit/signup_user_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/singup_view_body_bloc_consumer.dart';

import '../../../../core/utils/Widgets/build_appbar.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String routeName = "SignUproutename";
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupUserCubit>(
      create: (context) => SignupUserCubit(
        getIt.get<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBarOne(title: "حساب جديد", context: context),
        body: const SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
