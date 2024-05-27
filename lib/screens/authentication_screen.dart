import 'package:firebase_test_app/provider/auth_provider.dart';
import 'package:firebase_test_app/screens/forget_password.dart';
import 'package:firebase_test_app/widgets/custom-button.dart';
import 'package:firebase_test_app/widgets/custom_text_field.dart';
import 'package:firebase_test_app/widgets/screen_background_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticationScreen extends StatefulWidget {
  static String routeName = "/AuthenticationScreen";

  const AuthenticationScreen({
    super.key,
  });

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Consumer<AuthProvider>(builder: (context, provider, _) {
        return Scaffold(
          body: ScreenBackgroundWidget(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _key,
                child: ListView(
                  children: [
                    Image.asset(
                      "assets/icon-image.png",
                      height: 150,
                    ),
                    if (!provider.isLogin)
                      CustomTextField(
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Please enter a username";
                          } else {
                            return null;
                          }
                        },
                        controller: userNameController,
                        hintText: "Enter username",
                        labelText: "Username",
                        prefixIconData: Icons.person,
                      ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please enter email";
                        } else {
                          return null;
                        }
                      },
                      controller: emailController,
                      hintText: "Enter Email",
                      labelText: "Email",
                      prefixIconData: Icons.email,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextField(
                      validator: (String? value) {
                        if (value!.isEmpty || value.length < 8) {
                          return "Please enter password";
                        } else {
                          return null;
                        }
                      },
                      obscureText: provider.obscureText,
                      controller: passwordController,
                      hintText: "Enter Password",
                      labelText: "Password",
                      prefixIconData: Icons.password,
                      suffixIconData: IconButton(
                        onPressed: () {
                          provider.setObscureText();
                        },
                        icon: Icon(
                          provider.obscureText
                              ? Icons.remove_red_eye
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    if (!provider.isLogin)
                      CustomTextField(
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Please enter password";
                          } else if (value != passwordController.text) {
                            return "passwords don't match";
                          } else {
                            return null;
                          }
                        },
                        obscureText: provider.obscureText,
                        controller: confirmPasswordController,
                        hintText: "Enter password again",
                        labelText: "Confirm Password",
                        prefixIconData: Icons.password,
                        suffixIconData: IconButton(
                          onPressed: () {
                            provider.setObscureText();
                          },
                          icon: Icon(
                            provider.obscureText
                                ? Icons.remove_red_eye
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          // Logic
                          print("Everything is fine");
                        }
                      },
                      title: provider.isLogin ? "Login" : "Register",
                    ),
                    MaterialButton(
                      onPressed: () {
                        provider.setIsLogin();
                      },
                      child: Text(
                        provider.isLogin
                            ? "Don't have account? Register"
                            : "Already have account? Login",
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          ForgetPasswordScreen.routeName,
                        );
                      },
                      child: const Text("Forget password"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
