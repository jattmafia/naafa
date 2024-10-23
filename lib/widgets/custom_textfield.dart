import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatelessWidget {
  final List<TextInputFormatter> inputFormatters;
  final String? hintText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? initialValue;
  final TextInputType? keyboardType;


  const CustomTextfield(
      {super.key,
      this.inputFormatters = const [],
      this.hintText,
      this.onChanged,
      this.obscureText = false,
      this.initialValue,
      this.keyboardType,
      this.validator, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      
      keyboardType: keyboardType,
     //  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      obscureText: obscureText!,
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
