import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/get_user_data.dart';
import 'package:fruits_hub/core/utils/assets.dart';
import 'package:fruits_hub/features/home/presentation/manager/change_to_notification_view/change_to_notification_view_cubit.dart';
import 'package:fruits_hub/generated/l10n.dart';
import '../../../../../core/utils/Widgets/notification_widget.dart';
import '../../../../../core/utils/app_text_style.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.assetsImagesProfileImage),
      title: Text(
        S.of(context).goodMorning,
        style: TextStyles.regular16.copyWith(
          color: const Color(0xff949D9E),
        ),
      ),
      subtitle: Text(
        getUserData().userName,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      trailing: GestureDetector(
        onTap: () {
          context.read<ChangeToNotificationViewCubit>().changeIndex(1);
        },
        child: const NotificationWidget(),
      ),
    );
  }
}
