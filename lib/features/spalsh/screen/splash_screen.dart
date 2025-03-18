import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:horizon/const/resource.dart';
import 'package:horizon/core/config/router/route_name/route_names.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    // navigate();
  }

  void navigate() {
    Future.delayed(Duration(seconds: 1), () {
      context.router.replaceNamed(Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: FadeInUpBig(
          onFinish: (duration) {
            navigate();
          },
          child: Image.asset(
            R.ASSETS_IMAGE_JPG_HORIZON_JPG,
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }
}
