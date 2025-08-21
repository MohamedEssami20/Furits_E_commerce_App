import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/services/get_it_service.dart';
import 'package:fruits_hub/features/home/presentation/manager/edit_user_info_cubit/user_cubit.dart';
import '../../../../../core/utils/assets.dart';
import '../../../domain/repos/home_repo.dart';
import 'add_profile_image_bottom_sheet.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
    this.image,
  });
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: NetworkImage(
            image!,
          ),
          fit: BoxFit.cover,
        ),
        shape: const OvalBorder(),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: -17,
            right: 0,
            left: 0,
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => UserCubit(
                        homeRepo: getIt.get<HomeRepo>(),
                      ),
                      child: const AddProfileImageBottomSheet(),
                    );
                  },
                );
              },
              child: CircleAvatar(
                radius: 19.5,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 17,
                  backgroundColor: const Color(0xffF9F9F9),
                  child: SvgPicture.asset(
                    Assets.assetsImagesCameraIcon,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
