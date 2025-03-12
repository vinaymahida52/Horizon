import 'package:flutter/material.dart';
import 'package:horizon/core/config/theme/color_palette.dart';
import 'package:horizon/core/constraints/common_padding.dart';
import 'package:horizon/core/extension/context_ext.dart';
import 'package:horizon/core/extension/num_extension.dart';

class DashCard2 extends StatelessWidget {
  const DashCard2({
    super.key,
    required this.text1,
    required this.icon,
    required this.text2,
    required this.totalCount,
    required this.completedCount,
    required this.onTap,
  });
  final String text1;
  final IconData icon;
  final String text2;
  final int totalCount;
  final int completedCount;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      alignment: Alignment.center,
      padding: AppPadding.horizontalMedium.copyWith(
        top: 20,
        bottom: 20,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
          color: ColorPalette.whiteColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
              onPressed: onTap,
              child: Text(
                text1,
                style: context.bodyMedium.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text2,
                style: context.bodyMedium.copyWith(
                  color: Colors.grey,
                ),
              ),
              Text(
                "$completedCount/$totalCount",
                style: context.bodySmall.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          20.hBox,
          LinearProgressIndicator(
            value: completedCount / totalCount,
            backgroundColor: Colors.grey[300],
            minHeight: 8,
            borderRadius: BorderRadius.circular(10),
            valueColor:
                AlwaysStoppedAnimation<Color>(ColorPalette.primaryColor),
          ),
        ],
      ),
    );
  }
}
