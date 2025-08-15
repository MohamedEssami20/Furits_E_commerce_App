import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: const ShapeDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"),
          fit: BoxFit.cover,
        ),
        shape: OvalBorder(),
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
