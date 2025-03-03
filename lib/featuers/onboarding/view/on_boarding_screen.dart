import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/constant/colors_code.dart';
import 'package:marketi/core/utils/onBoarding_list_model.dart';
import 'package:marketi/featuers/onboarding/cubit/onboarding_cubit.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = OnBoardingCubit.get(context);

        return Scaffold(
          backgroundColor: TColors.CWhite,
          body: SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: PageView.builder(
                      controller: cubit.pageController,
                      onPageChanged: (index){
                        cubit.changeCurrentIndex(index);
                      },
                      itemCount: onBoardingList.length,
                      itemBuilder:
                          (context, index) => Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 14.w,
                              vertical: 16.h,
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 50.h),
                                SvgPicture.asset(onBoardingList[index].image!),
                                SizedBox(height: 40.h),
                                Text(
                                  onBoardingList[index].title!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: TColors.CDarkBLUE_900,
                                  ),
                                ),
                                SizedBox(height: 38.h),
                                Text(
                                  onBoardingList[index].description!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: TColors.CDarkBLUE_900,
                                  ),
                                ),
                                SizedBox(height: 28.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ...List.generate(
                                      onBoardingList.length,
                                      (index) => AnimatedContainer(
                                        duration: Duration(milliseconds: 150),
                                        margin: EdgeInsets.only(right: 5.w),
                                        height:
                                            cubit.currentIndex == index
                                                ? 16.h
                                                : 14.h,
                                        width:
                                            cubit.currentIndex == index
                                                ? 16.w
                                                : 14.w,
                                        decoration: BoxDecoration(
                                          color:
                                              cubit.currentIndex == index
                                                  ? TColors.CDarkBLUE_900
                                                  : TColors.CLightBLUE_900,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  width: double.infinity,
                                  height: 48.h,
                                  child: MaterialButton(
                                    onPressed: () {
                                      if (context
                                              .read<OnBoardingCubit>()
                                              .currentIndex <
                                          onBoardingList.length - 1) {
                                        context
                                            .read<OnBoardingCubit>()
                                            .nextPage();
                                      } else {
                                        //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ))
                                      }
                                    },
                                    color: TColors.CBLUE_BTN,
                                    textColor: TColors.CWhite,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 50,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: Text(
                                      cubit.currentIndex < onBoardingList.length - 1
                                          ? 'Next'
                                          : 'Get Started',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: TColors.CWhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
