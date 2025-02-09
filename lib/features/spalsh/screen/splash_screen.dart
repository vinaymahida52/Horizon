import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:horizon/const/resource.dart';
import 'package:horizon/core/extension/num_extension.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: FadeInUpBig(
          child: Column(
            children: [
              Image.asset(R.ASSETS_IMAGE_PNG_LOGO_TRANS_PNG),
              10.hBox,
              // Text(
              //   'Horizon',
              //   style: context.textTheme.headline4!.copyWith(
              //     color: context.colorScheme.primary,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
