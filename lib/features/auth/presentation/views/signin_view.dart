import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/core/utils/Widgets/build_appbar.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/sigin_view_body_bloc_consumer.dart';
import 'package:fruits_hub/features/auth/presentation/views/widgets/signin_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login-view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: buildAppBar(context: context, title: "تسجيل الدخول"),
          body:const SiginViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}


