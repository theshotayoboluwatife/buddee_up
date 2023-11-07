import 'package:BuddeeUp/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class LoginSignUp extends StatelessWidget {
  const LoginSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.purple,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(227, 127, 236, 0.96),
                Color.fromRGBO(196, 32, 210, 0.96),
                Color.fromRGBO(
                    163, 11, 176, 0.96), // rgba(163.15, 11.02, 176.37, 0.96)
              ],
            ),
          ),
          child: Column(
            children: [
              const Spacer(),
              const Image(
                image: AssetImage("assets/images/buddee_up_logo.png"),
                width: 214,
                height: 212,
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text: "BUDDEEUP",
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                text: "Create Account",
                onpress: () => Navigator.pushNamed(context, '/signup'),
                hasBorder: true,
                buttonColor: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                text: "Sign In",
                onpress: () => Navigator.pushNamed(context, '/signin'),
                buttonColor: const Color(0xFFDA3EE8),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                child: const CustomText(
                  text: "Trouble signing in?",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                onTap: () => Navigator.pushNamed(context, '/account_recovery'),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
