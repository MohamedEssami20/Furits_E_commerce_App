import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/get_user_data.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';
import 'package:fruits_hub/features/home/presentation/manager/edit_user_info_cubit/user_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../manager/get_user_cubit/get_user_cubit.dart';
import 'profile_picture.dart';

class ProfileAccountAndImage extends StatelessWidget {
  const ProfileAccountAndImage({super.key, this.userEntity});
  final UserEntity? userEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 25,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            if (state is EditUserImageSuccess ||
                state is EditUserImageFailure) {
              context.read<GetUserCubit>().getUserData();
            }
          },
          builder: (context, state) {
            if (state is EditUserImageLoading) {
              return Skeletonizer(
                child: ProfilePicture(
                  image: userEntity?.image ?? getUserData().image,
                ),
              );
            } else {
              return ProfilePicture(
                image: userEntity?.image ?? getUserData().image,
              );
            }
          },
        ),
        Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userEntity?.userName ?? getUserData().userName,
              style: TextStyles.bold13.copyWith(
                color: const Color(0xFF131F46),
              ),
            ),
            Text(
              userEntity?.email ?? getUserData().email,
              style: TextStyles.regular13.copyWith(
                color: const Color(0xFF888FA0),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
