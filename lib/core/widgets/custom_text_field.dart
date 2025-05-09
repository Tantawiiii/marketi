import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant/assets_path.dart';
import '../constant/colors_code.dart';
import '../theme/texts_styles.dart';


class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String prefixIconPath;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    required this.prefixIconPath,
    this.validator,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      validator: widget.validator,
            decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyles.font14WhiteDarkMedium,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            widget.prefixIconPath,
            width: 24,
            height: 24,
            color: TColors.ICONS,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: TColors.CBLUE_BTN),
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
          icon: SvgPicture.asset(
            _obscureText
                ? AssetsPATH.iHidden
                : AssetsPATH.iHiddenOn,
            width: 24,
            height: 24,
            color: TColors.ICONS,
          ),
          onPressed: _togglePasswordVisibility,
        )
            : null,
      ),
    );
  }
}
