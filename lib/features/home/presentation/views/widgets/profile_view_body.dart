import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/Widgets/build_app_bar.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/features/home/domain/entities/profile_item_entity.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/builder/profile_account_and_image_builder.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/notification_and_mode_item.dart';
import '../../../../../core/utils/app_text_style.dart';
import 'change_language.dart';
import 'custom_profile_divider.dart';
import 'profile_item.dart';
import 'sign_out_item.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAppBar(
            context,
            title: "حسابي",
            showBackButton: false,
            showNotification: false,
          ),
          const SizedBox(
            height: 20,
          ),
          const ProfileAccountAndImageBuilder(),
          const SizedBox(
            height: 22,
          ),
          Text(
            'عام',
            style: TextStyles.semiBold13.copyWith(
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ProfileItemEntity.getProfileItems().length,
            separatorBuilder: (context, index) => const CustomProfileDivider(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(top: 9),
              child: ProfileItem(
                profileItemEntity: ProfileItemEntity.getProfileItems()[index],
                onPress: () {},
              ),
            ),
          ),
          const CustomProfileDivider(),
          NotificationAndModeItem(
            title: "الاشعارات",
            icon: Assets.assetsImagesNotificationIcon,
            onToggle: (value) {},
          ),
          const CustomProfileDivider(),
          const ChangeLangauge(),
          const CustomProfileDivider(),
          NotificationAndModeItem(
            title: "الوضع ",
            icon: Assets.assetsImagesMagicpenIcon,
            onToggle: (value) {},
          ),
          const CustomProfileDivider(),
          const SizedBox(
            height: 20,
          ),
          Text(
            'المساعده',
            style: TextStyles.semiBold13.copyWith(
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          ProfileItem(
            profileItemEntity: ProfileItemEntity.getHelpItems()[0],
            onPress: () {},
          ),
          const CustomProfileDivider(),
          const Spacer(),
          const SignOut(),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
