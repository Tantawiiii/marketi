import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/constant/colors_code.dart';

import '../constant/assets_path.dart';
import '../helper/spacing.dart';
import '../theme/texts_styles.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;


  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Bounce(
        onTap: onPressed,
        child: Container(
          width: width ?? double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: TColors.CPrimary,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.font18WhiteMedium,
                ),
              ),

              SvgPicture.asset(
                AssetsPATH.iArrow,
                width: 36.w,
                height: 36.h,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
