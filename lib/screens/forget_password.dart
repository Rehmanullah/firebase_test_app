import 'package:firebase_test_app/widgets/custom-button.dart';
import 'package:firebase_test_app/widgets/custom_text_field.dart';
import 'package:firebase_test_app/widgets/screen_background_widget.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static String routeName = '/ForgetPasswordScreen';
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ScreenBackgroundWidget(
          child: ListView(
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                "assets/icon-image.png",
                height: 150,
              ),
              const Text(
                "Enter your email to reset your password",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: emailController,
                hintText: "Enter email",
                labelText: "Email",
                prefixIconData: Icons.email,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Enter email";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                onPressed: () {},
                title: "Forget Password",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
