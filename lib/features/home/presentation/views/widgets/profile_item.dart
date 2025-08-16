import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/features/home/domain/entities/profile_item_entity.dart';
import '../../../../../core/utils/app_text_style.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.profileItemEntity, this.onPress});
  final ProfileItemEntity profileItemEntity;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 7,
            children: [
              SvgPicture.asset(
                profileItemEntity.image,
              ),
              Text(
                profileItemEntity.title,
                style: TextStyles.semiBold13.copyWith(
                  color: const Color(0xFF949D9E),
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
            size: 20,
          ),
        ],
      ),
    );
  }
}
