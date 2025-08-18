import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/get_user_dummu_data.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/profile_account_and_image.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../manager/user_cubit/get_user_cubit.dart';

class ProfileAccountAndImageBuilder extends StatelessWidget {
  const ProfileAccountAndImageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserCubit, GetUserState>(
      builder: (context, state) {
        if (state is GetUserSuccess) {
          return ProfileAccountAndImage(
            userEntity: state.user,
          );
        } else if (state is GetUserFailure) {
          return const ProfileAccountAndImage(
            userEntity: null,
          );
        } else {
          return Skeletonizer(
            child:  ProfileAccountAndImage(
              userEntity: getDummyUserEntity(),
            ),
          );
        }
      },
    );
  }
}
