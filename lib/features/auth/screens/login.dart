import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naafa/features/auth/notifier/auth_notifier.dart';
import 'package:naafa/features/auth/screens/signup.dart';
import 'package:naafa/gen/assets.gen.dart';
import 'package:naafa/utils/extension.dart';
import 'package:naafa/widgets/custom_textfield.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final obsecure = useState(true);
    final state = ref.watch(authNotifierProvider);
    final notifier = ref.read(authNotifierProvider.notifier);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: SafeArea(
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
                  height: 30,
                ),
                 CustomTextfield(
                  initialValue: state.authModel.username,
                  hintText: 'Username',
                  onChanged: (value) {
                    notifier.usernameChange(value);
                  },
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "Username is required";
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                 CustomTextfield(
                  hintText: 'Password',
                  obscureText: obsecure.value,
                  initialValue: state.authModel.password,
                  onChanged: (value) {
                    notifier.passwordChange(value);
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      obsecure.value = !obsecure.value;
                    },
                    icon: obsecure.value
                        ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),),
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "Password is required";
                    }
                  },
                  
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
                        onPressed:state.loading ? null : () async {
                          if(formKey.currentState!.validate()){
                          await  notifier.login();
                          }
                        }, child:state.loading ? const CircularProgressIndicator() : const Text("Sign In"))),
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
        ),
      ),
    );
  }
}
