import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/assets.dart';

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
        ],
      ),
    );
  }
}
