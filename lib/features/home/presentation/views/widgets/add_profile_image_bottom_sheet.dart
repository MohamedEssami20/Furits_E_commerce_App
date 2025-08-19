import 'package:flutter/material.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';

class AddProfileImageBottomSheet extends StatelessWidget {
  const AddProfileImageBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: Colors.white,
      onClosing: () {},
      builder: (context) => Container(
        width: double.infinity,
        height: 150,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'اختر من',
              style: TextStyles.semiBold13.copyWith(
                color: const Color(0xFF1B5E37),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    label: const Text('من الكاميرا'),
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.lightSecondaryColor,
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    label: const Text('من المجلد'),
                    icon: const Icon(
                      Icons.folder_outlined,
                      color: AppColors.lightSecondaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
