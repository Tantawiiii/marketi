import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/constant/colors_code.dart';
import 'package:marketi/core/constant/strings_text.dart';
import 'package:marketi/core/theme/texts_styles.dart';

import '../../../../core/constant/assets_path.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/helper/validation_utils.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [

                Align(
                  alignment: Alignment.topLeft,
                  child: Bounce(
                    onTap: () {
                      Navigator.pushNamed(context, RRoutes.rLogin);
                    },
                    child: SvgPicture.asset(AssetsPATH.iArrowLeft),
                  ),
                ),
                verticalSpace(10),
                Center(child: Image.asset(AssetsPATH.pLogoLogIn, fit: BoxFit.cover,height: 150.h,)),

                Text(
                  TTexts.tSignUp,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.font24BlackMedium,
                ),
                verticalSpace(20),
                CustomTextField(
                  controller: _nameController,
                  hintText: TTexts.tFullName,
                  prefixIconPath: AssetsPATH.iProfile,
                  validator: ValidationUtils.validateFullName,
                ),
                verticalSpace(15),
                CustomTextField(
                  controller: _emailController,
                  hintText: TTexts.tEmailHint,
                  prefixIconPath: AssetsPATH.iEmail,
                  validator: ValidationUtils.validateEmail,
                ),
                verticalSpace(15),
                CustomTextField(
                  controller: _phoneController,
                  hintText: TTexts.tPhoneHint,
                  prefixIconPath: AssetsPATH.iPhone,
                  validator: ValidationUtils.validateEgyptianPhoneNumber,
                ),
                verticalSpace(15),
                CustomTextField(
                  controller: _passwordController,
                  hintText: TTexts.tPasswordHint,
                  prefixIconPath: AssetsPATH.iLock,
                  obscureText: true,
                  validator: ValidationUtils.validatePassword,
                ),
                verticalSpace(15),
                CustomTextField(
                  controller: _confirmController,
                  hintText: TTexts.tConfirmPass,
                  prefixIconPath: AssetsPATH.iLock,
                  obscureText: true,
                  validator:
                      (value) => ValidationUtils.validateConfirmPassword(
                        value,
                        _passwordController.text,
                      ),
                ),

                verticalSpace(40),
                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterSuccess) {
                      CustomToast.showToast(
                        message: "Registration Successful!",
                        backgroundColor: Colors.green,
                      );
                      Navigator.pushNamed(context, RRoutes.rOtp);
                    } else if (state is RegisterFailure) {

                      CustomToast.showToast(
                        message: "Registration Failed!",
                        backgroundColor: Colors.red,
                      );
                    }
                  },
                  builder: (context, state) {
                    return state is RegisterLoading
                        ? Center(child: SpinKitWave(
                      color: TColors.CPrimary,
                      size: 40.0,
                    ))
                        : CustomButton(
                      text: TTexts.tSIGNup,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<RegisterCubit>().register(
                            _nameController.text,
                            _emailController.text,
                            _passwordController.text,
                            _confirmController.text,
                            _phoneController.text,
                          );

                        }
                      },
                    );
                  },
                ),
                verticalSpace(20),
                Text(
                  TTexts.tOr,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.font14LightMedium,
                ),
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
                    const Text(TTexts.tAlreadyAccount),
                    Bounce(
                      onTap: () {
                        Navigator.pushNamed(context, RRoutes.rLogin);
                      },
                      child: const Text(
                        TTexts.tSignIn,
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
