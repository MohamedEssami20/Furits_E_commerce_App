import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubit/app_theme_cubit.dart/app_theme_cubit.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_profile_divider.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/sign_out_item.dart';
import 'package:fruits_hub/generated/l10n.dart';

import '../../../../../core/utils/Widgets/build_app_bar.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../domain/entities/profile_item_entity.dart';
import '../../manager/profile_view_cubit/profile_view_cubit.dart';
import 'builder/profile_account_and_image_builder.dart';
import 'change_language.dart';
import 'notification_and_mode_item.dart';
import 'profile_item.dart';

class AccountSection extends StatefulWidget {
  const AccountSection({
    super.key,
  });

  @override
  State<AccountSection> createState() => _AccountSectionState();
}

class _AccountSectionState extends State<AccountSection> {
  bool isDarkMode = false;
  bool isNotification = false;
  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<AppThemeCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildAppBar(
          context,
          title: S.of(context).myAccount,
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
          S.of(context).general,
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
          itemCount: ProfileItemEntity.getProfileItems(context).length,
          separatorBuilder: (context, index) => const CustomProfileDivider(),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(top: 9),
            child: ProfileItem(
              profileItemEntity:
                  ProfileItemEntity.getProfileItems(context)[index],
              onPress: () {
                context.read<ProfileViewCubit>().changeIndex(index + 1);
              },
            ),
          ),
        ),
        const CustomProfileDivider(),
        NotificationAndModeItem(
          value: isNotification,
          title: S.of(context).notification,
          icon: Assets.assetsImagesNotificationIcon,
          onToggle: (value) {
            setState(() {
              isNotification = value;
            });
          },
        ),
        const CustomProfileDivider(),
        const ChangeLangauge(),
        const CustomProfileDivider(),
        NotificationAndModeItem(
          value: isCurrentlyDark(),
          title: S.of(context).mode,
          icon: Assets.assetsImagesMagicpenIcon,
          onToggle: (value) {
            setState(() {
              isDarkMode = value;
              changeTheme(isDarkMode: value, themeCubit: themeCubit);
            });
          },
        ),
        const CustomProfileDivider(),
        const SizedBox(
          height: 20,
        ),
        Text(
          S.of(context).help,
          style: TextStyles.semiBold13.copyWith(
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        ProfileItem(
          profileItemEntity: ProfileItemEntity.getHelpItems(context)[0],
          onPress: () {
            context.read<ProfileViewCubit>().changeIndex(5);
          },
        ),
        const CustomProfileDivider(),
        const Spacer(),
        const SignOut(),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }

  void changeTheme(
      {required bool isDarkMode, required AppThemeCubit themeCubit}) {
    if (isDarkMode) {
      themeCubit.changeTheme(themeMode: ThemeMode.dark);
    } else {
      themeCubit.changeTheme(themeMode: ThemeMode.light);
    }
  }

  bool isCurrentlyDark() {
    final themeCubit = context.read<AppThemeCubit>();
    return themeCubit.state.themeMode == ThemeMode.dark;
  }
}
