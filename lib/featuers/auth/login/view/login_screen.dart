import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/constant/colors_code.dart';
import 'package:marketi/core/constant/strings_text.dart';
import 'package:marketi/core/helper/spacing.dart';
import 'package:marketi/core/theme/texts_styles.dart';
import 'package:marketi/featuers/auth/login/cubit/login_cubit.dart';
import 'package:marketi/featuers/auth/login/cubit/login_state.dart';

import '../../../../core/constant/assets_path.dart';
import '../../../../core/helper/validation_utils.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/custom_toast.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final TextEditingController emailController= TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (_) => LoginCubit(),
      child: Scaffold(
        backgroundColor: TColors.CWhite,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.h),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Center(child: Image.asset(AssetsPATH.pLogoLogIn, fit: BoxFit.cover,)),
                verticalSpace(12),
                CustomTextField(
                  controller:emailController  ,
                  hintText: TTexts.tEmailHint,
                  prefixIconPath: AssetsPATH.iEmail,
                  validator: ValidationUtils.validateEmail,
                ),
                verticalSpace(12),
                CustomTextField(
                  controller: passwordController,
                  hintText: TTexts.tPasswordHint,
                  prefixIconPath: AssetsPATH.iLock,
                  obscureText: true,
                  validator: ValidationUtils.validatePassword,
                ),
                verticalSpace(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Transform.scale(
                          scale: 0.8,
                          child: Switch(
                            activeColor: TColors.CWhite,
                            activeTrackColor: TColors.CPrimary,
                            value: true,
                            onChanged: (val) {},
                          ),
                        ),
                        Text(TTexts.tRememberMe, style: AppTextStyles.font12DarkLight),
                      ],
                    ),
                    Text(TTexts.tForgotPassword, style: AppTextStyles.font12DarkLight),
                  ],
                ),
                verticalSpace(20),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      CustomToast.showToast(
                        message: "Login Successful!",
                        backgroundColor: Colors.green,
                      );
                      Navigator.pushNamed(context, RRoutes.rHome);
                    } else if (state is LoginFailure) {

                      CustomToast.showToast(
                        message: "Login Failed!",
                        backgroundColor: Colors.red,
                      );
                    }
                  },
                  builder: (context, state) {
                    return state is LoginLoading
                        ? Center(child: SpinKitWave(
                      color: TColors.CPrimary,
                      size: 40.0,
                    ))
                        : CustomButton(
                      text: TTexts.tSignIn,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<LoginCubit>().Login(
                            emailController.text,
                            passwordController.text,
                          );
                        }
                      },
                    );
                  },
                ),
                verticalSpace(20),
                Text(TTexts.tOr, textAlign: TextAlign.center, style: AppTextStyles.font14LightMedium),
                verticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 12,
                  children: [
                    SvgPicture.asset(AssetsPATH.iGoogle, height: 28.h,),
                    SvgPicture.asset(AssetsPATH.iFacebook, height: 32.h,),
                    SvgPicture.asset(AssetsPATH.iApple,height: 32.h,),
                  ],
                ),
                verticalSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(TTexts.tLoginDontAccount),
                    Bounce(
                      onTap: () {Navigator.pushNamed(context, RRoutes.rRegister);
                      },
                      child: const Text(
                        TTexts.tSignUp,
                        style: TextStyle(color: TColors.CPrimary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
