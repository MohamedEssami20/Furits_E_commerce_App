import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_error_snackbar.dart';
import 'package:fruits_hub/core/utils/Widgets/custom_progress_hud.dart';
import 'package:fruits_hub/generated/l10n.dart';

import '../../manager/add_order_cubit/add_order_cubit.dart';

class AddOrderCubitBlocConsumer extends StatelessWidget {
  const AddOrderCubitBlocConsumer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      builder: (context, state) {
        return CustomProgressHud(
          inAsyncCall: state is AddOrderLoading ? true : false,
          child: child,
        );
      },
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          buildErrorSnackBar(context, S.of(context).orderAddedSuccess);
        }
        if (state is AddOrderError) {
          buildErrorSnackBar(
            context,
            state.message,
          );
        }
      },
    );
  }
}
