import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/Widgets/build_app_bar.dart';
import 'package:fruits_hub/features/home/presentation/manager/change_to_notification_view/change_to_notification_view_cubit.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/old_notification_item_list.dart';
import '../../../../generated/l10n.dart';
import 'widgets/new_notification_item_list.dart';
import 'widgets/notification_header_item.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
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
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16),
            child: Column(
              children: [
                NotificationHeaderItem(
                  theme: theme,
                  title: S.of(context).newText,
                ),
                const SizedBox(
                  height: 20,
                ),
                const NewNotificationItemList(),
                const SizedBox(
                  height: 20,
                ),
                NotificationHeaderItem(
                  theme: theme,
                  title: S.of(context).inAnotherTime,
                ),
                const SizedBox(
                  height: 20,
                ),
                const OldNotificationItemList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
