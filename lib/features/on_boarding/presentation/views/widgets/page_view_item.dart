import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.subTitle,
      required this.title});
  final String image, backgroundImage;
  final String subTitle;
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AspectRatio(
                  aspectRatio: 1.9,
                  child: SvgPicture.asset(image),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(18),
                child: Text("تخط"),
              ),
            ],
          ),
        ),
        const SizedBox(height: 80),
        title,
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
