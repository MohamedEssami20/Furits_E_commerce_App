import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/Widgets/build_app_bar.dart';
import 'package:fruits_hub/features/home/presentation/manager/change_to_notification_view/change_to_notification_view_cubit.dart';

import '../../../../generated/l10n.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildAppBar(
          context,
          title: S.of(context).notifications,
          onBackPress: () =>
              BlocProvider.of<ChangeToNotificationViewCubit>(context)
                  .changeIndex(0),
          showBackButton: true,
          showNotification: false,
        ),
      ],
    );
  }
}
