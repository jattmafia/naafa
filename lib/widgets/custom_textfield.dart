import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:naafa/utils/extension.dart';

class CustomTextfield extends StatelessWidget {
  final List<TextInputFormatter> inputFormatters;
  final String? hintText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const CustomTextfield(
      {super.key,
      this.inputFormatters = const [],
      this.hintText,
      this.onChanged,
      this.validator, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      //  inputFormatters: [FilteringTextInputFormatter.digitsOnly],

      decoration: InputDecoration(
        suffixIcon:suffixIcon,
        filled: true,
        fillColor: Color(0xffE5E5E5),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
