import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper/build_success_and_error_snackbar.dart';
import 'package:fruits_hub/features/home/presentation/manager/get_user_cubit/get_user_cubit.dart';
import 'package:fruits_hub/features/products_details/presentation/manager/reviews_cubit/reviews_cubit.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/Widgets/custom_button.dart';
import '../../../../core/utils/Widgets/custom_text_form_filed.dart';
import '../../../../core/utils/assets.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/user_comment_model.dart';
import '../manager/rating_count_cubit/rating_count_cubit.dart';

class WriteCommentTextField extends StatefulWidget {
  const WriteCommentTextField({
    super.key,
    required this.productId,
  });

  final String productId;
  @override
  State<WriteCommentTextField> createState() => _WriteCommentTextFieldState();
}

final controller = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _WriteCommentTextFieldState extends State<WriteCommentTextField> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final user = context.read<GetUserCubit>().userEntity;
    return Row(
      spacing: 8,
      children: [
        Expanded(
          flex: 3,
          child: Form(
            key: formKey,
            child: CustomTextFormFiled(
              controller: controller,
              validator: (val) {
                if (val!.isEmpty) {
                  return S.of(context).pleaseEnterComment;
                } else {
                  return null;
                }
              },
              hintText: S.of(context).writeComment,
              textInputType: TextInputType.text,
              prefixIcon: const Padding(
                padding: EdgeInsetsDirectional.only(start: 10, end: 8),
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                    Assets.assetsImagesBoldAvatar,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 50,
            child: CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<ReviewsCubit>().addReview(
                        productId: widget.productId,
                        userCommentModel: UserReviewModel(
                          comment: controller.text,
                          userName: user!.userName,
                          userId: user.uid,
                          userImage: user.image,
                          date: _getDateNow(),
                          rate: context
                              .read<RatingCountCubit>()
                              .getCurrentRating(),
                        ),
                        genralErrorMessage: S.of(context).errorMessage,
                      );
                }
              },
              child: BlocConsumer<ReviewsCubit, ReviewsState>(
                builder: (context, state) {
                   final isUserComentend =
                        context.watch<ReviewsCubit>().isUserCommentedFlag;
                  if (state is AddCommentLoading) {
                    return SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: theme.colorScheme.onPrimary,
                      ),
                    );
                  } else {
                   
                    return FittedBox(
                      child: Text(
                        isUserComentend
                            ? S.of(context).editComment
                            : S.of(context).send,
                        style: theme.textTheme.headlineLarge?.copyWith(
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    );
                  }
                },
                listener: (context, state) {
                  if (state is AddCommentSuccess) {
                    buildSuccessAndErrorSnackBar(
                        context, S.of(context).commentAdded);
                  }
                  if (state is AddCommentFailure) {
                    buildSuccessAndErrorSnackBar(
                      context,
                      state.errormessage,
                    );
                  }
                },
              ),
            ),
          ),
        )
      ],
    );
  }

  String _getDateNow() {
    DateTime now = DateTime.now();
    final dateFormat = DateFormat('yyyy-MM-dd');
    return dateFormat.format(now);
  }
}
