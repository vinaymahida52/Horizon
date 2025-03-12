import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:horizon/core/config/theme/color_palette.dart';
import 'package:horizon/core/extension/context_ext.dart';

class UploadWidget extends StatelessWidget {
  const UploadWidget({
    super.key,
    required this.data,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: DottedBorder(
        radius: Radius.circular(10),
        dashPattern: [8, 4],
        borderType: BorderType.RRect,
        strokeCap: StrokeCap.round,
        color: ColorPalette.greyColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.upload, color: ColorPalette.greyColor),
              Text(
                data,
                style: context.bodyMedium.copyWith(
                  color: ColorPalette.greyColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
