
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:marketi/core/constant/assets_path.dart';
import 'package:marketi/core/routing/routes.dart';
import 'package:marketi/core/constant/colors_code.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, RRoutes.rOnBoarding);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.CWhite,
      body: Center(
        child: Image.asset(AssetsPATH.pLogo_splash),
      ),
    );
  }
}
