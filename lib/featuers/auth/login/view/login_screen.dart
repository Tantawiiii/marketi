import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/constant/colors_code.dart';

import '../../../../core/constant/assets_path.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.CWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Image.asset(AssetsPATH.pLogoLogIn, fit: BoxFit.cover,)),
            ],
          ),
        ),
      ),
    );
  }
}
