import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:horizon/const/resource.dart';
import 'package:horizon/core/config/theme/color_palette.dart';
import 'package:horizon/core/config/theme/k_theme.dart';
import 'package:horizon/core/extension/context_ext.dart';
import 'package:horizon/core/extension/num_extension.dart';

class CommonAppbar extends ConsumerWidget implements PreferredSizeWidget {
  CommonAppbar({
    super.key,
    this.height = kToolbarHeight,
    this.actions = const [],
    this.centerTitle = true,
    this.elevation = 50,
  });
  final double height;
  List<Widget> actions;
  bool centerTitle;
  double elevation;

  @override
  Widget build(BuildContext context, ref) {
    final theme = ref.watch(themeProvider);

    return AppBar(
      elevation: elevation,
      toolbarHeight: height,
      centerTitle: centerTitle,
      surfaceTintColor: ColorPalette.whiteColor,
      backgroundColor: ColorPalette.whiteColor,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Horizon',
              style: context.bodyMedium, textAlign: TextAlign.center),
          10.wBox,
          Image.asset(R.ASSETS_IMAGE_JPG_HORIZON_JPG, height: 30, width: 30),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.nightlight_round,
            color: ColorPalette.blackColor,
          ),
          onPressed: () {
            theme.changeTheme();
          },
        ),
        // moon icon
        ...actions,
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
