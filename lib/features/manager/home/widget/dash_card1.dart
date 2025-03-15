import 'package:flutter/material.dart';
import 'package:horizon/core/config/theme/color_palette.dart';
import 'package:horizon/core/constraints/common_padding.dart';
import 'package:horizon/core/extension/context_ext.dart';
import 'package:horizon/core/extension/num_extension.dart';

class DashCard1 extends StatelessWidget {
  const DashCard1({
    super.key,
    required this.text1,
    required this.icon,
    required this.text2,
    required this.count,
    this.onTap,
  });
  final String text1;
  final IconData icon;
  final String text2;
  final int count;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 150,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: context.bodyMedium.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    count.toString(),
                    style: context.bodyMedium
                        .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Icon(
                icon,
                size: 30,
                color: ColorPalette.primaryLightColor,
              ),
            ],
          ),
          20.hBox,
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            onPressed: onTap,
            child: Text(
              text2,
              style: context.bodyMedium.copyWith(
                color: ColorPalette.primaryPink,
              ),
            ),
          )
        ],
      ),
    );
  }
}
