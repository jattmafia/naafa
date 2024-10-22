import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:naafa/features/auth/screens/signup.dart';
import 'package:naafa/gen/assets.gen.dart';
import 'package:naafa/utils/extension.dart';
import 'package:naafa/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: context.kdefaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.images.login),
            Text(
              "Login",
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
              suffixIcon: Icon(Icons.visibility),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot password ?',
                  style: context.style.labelLarge!
                      .copyWith(color: context.theme.primaryColor),
                )),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
                width: double.infinity,
                child: FilledButton(
                    onPressed: () {}, child: const Text("Sign In"))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account ?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                    child: const Text("Sign Up"))
              ],
            )
          ],
        ),
      )),
    );
  }
}
