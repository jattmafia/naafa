import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naafa/features/auth/screens/login.dart';
import 'package:naafa/gen/assets.gen.dart';
import 'package:naafa/utils/extension.dart';
import 'package:naafa/widgets/custom_textfield.dart';

import '../notifier/auth_notifier.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useRef(GlobalKey<FormState>());
    final state = ref.watch(authNotifierProvider);
    final notifier = ref.read(authNotifierProvider.notifier);
     final controller = useAnimationController(
      duration: const Duration(seconds: 5), 
    );

    useEffect(() {
      controller.repeat(reverse: true); 
      return controller.dispose; 
    }, [controller]);
    

    final animation = useMemoized(() => Tween<Offset>(
    begin:const Offset(-0,0),
    end: const Offset(1.3, 0),
  ).animate(CurvedAnimation(
    parent: controller,
    curve: Curves.linear,
  )));
    return Scaffold(
      body: AbsorbPointer(
        absorbing: state.loading,
        child: SafeArea(
            child: Padding(
          padding: context.kdefaultPadding,
          child: SingleChildScrollView(
            child: Form(
              key: formKey.value,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SlideTransition(
                    position: animation,
                      child: SvgPicture.asset(
                    Assets.images.login,
                    alignment: Alignment.center,
                  )),
                  const SizedBox(height: 20),
                  Text(
                    "SignUp",
                    style: context.style.headlineLarge,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextfield(
                    initialValue: state.authModel.username,
                    onChanged: (value) {
                      notifier.usernameChange(value);
                    },
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "Username is required";
                      }
                      return null;
                    },
                    hintText: 'Username',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfield(
                    obscureText: true,
                    initialValue: state.authModel.password,
                    onChanged: (p0) {
                      notifier.passwordChange(p0);
                    },
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                    hintText: 'Password',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfield(
                    hintText: 'Email',
                    initialValue: state.authModel.email,
                    onChanged: (p0) {
                      notifier.emailChange(p0);
                    },
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "Email is required";
                      } else if (p0.isNotEmpty &&
                          !EmailValidator.validate(p0)) {
                        return "Invalid Email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfield(
                    initialValue: state.authModel.phone,
                    keyboardType: TextInputType.phone,
                    hintText: 'Phone',
                    onChanged: (p0) {
                      notifier.phoneChange(p0);
                    },
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "Phone is required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextfield(
                    initialValue: state.authModel.address,
                    onChanged: (p0) {
                      notifier.addressChange(p0);
                    },
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "Address is required";
                      }
                      return null;
                    },
                    hintText: 'Address',
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                          onPressed: state.loading
                              ? null
                              : () async {
                                  if (formKey.value.currentState!.validate()) {
                                    try {
                                      await notifier.signup();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text("Signup successfull"),
                                        ),
                                      );

                                      notifier.clearFields();

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginScreen()));
                                    } catch (e) {
                                      if (context.mounted) {
                                        context.error(e);
                                      }
                                    }
                                  }
                                },
                          child: state.loading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(),
                                )
                              : const Text("Sign Up"))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account ?"),
                      TextButton(
                          onPressed: () {
                            notifier.clearFields();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text("Sign In"))
                    ],
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
