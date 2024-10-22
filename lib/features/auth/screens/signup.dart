import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naafa/gen/assets.gen.dart';
import 'package:naafa/utils/extension.dart';
import 'package:naafa/widgets/custom_textfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: context.kdefaultPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(Assets.images.signup),
              const SizedBox(height: 10),
              Text(
                "SignUp",
                style: context.style.headlineLarge,
              ),
              const SizedBox(
                height: 40,
              ),
              const CustomTextfield(
                hintText: 'Username',
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextfield(
                hintText: 'Password',
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextfield(
                hintText: 'Email',
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextfield(
                hintText: 'Phone',
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextfield(
                hintText: 'Address',
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                      onPressed: () {}, child: const Text("Sign Up"))),
            ],
          ),
        ),
      )),
    );
  }
}
