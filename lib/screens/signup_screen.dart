import 'package:BuddeeUp/custom_widgets/custom_button.dart';
import 'package:BuddeeUp/custom_widgets/custom_text.dart';
import 'package:BuddeeUp/helpers/auth.dart';
import 'package:BuddeeUp/helpers/logger.dart';
import 'package:BuddeeUp/screens/phone_verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:email_validator/email_validator.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _cPasswordTextController =
      TextEditingController();
  bool _isPasswordVisible = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailTextController.dispose();
    _cPasswordTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(
                  227, 127, 236, 0.96), // rgba(227.15, 126.78, 235.88, 0.96)
              Color.fromRGBO(
                  196, 32, 210, 0.96), // rgba(196.07, 31.56, 210.37, 0.96)
              Color.fromRGBO(
                  163, 11, 176, 0.96), // rgba(163.15, 11.02, 176.37, 0.96)
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SafeArea(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/buddee_up_logo.png",
                  height: 50,
                ),
                const SizedBox(
                  width: 5,
                ),
                const CustomText(
                  text: "BUDDEEUP",
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                )
              ],
            )),
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    //email adress textfield
                    Container(
                      height: 60,
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: TextFormField(
                        validator: (value) {
                          if (!(EmailValidator.validate(
                              _emailTextController.text.trim()))) {
                            return 'Input a valid email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailTextController,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.person,
                            size: 40,
                          ),
                          border: InputBorder.none,
                          hintText: "Enter your Email",
                          hintStyle: TextStyle(
                              color: Color(0xFF616161),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //password textfield
                    Container(
                      height: 60,
                      width: double.infinity,
                      padding:
                          const EdgeInsets.only(left: 60, top: 10, bottom: 10),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.length < 6) {
                            return 'Password must be greater than 6';
                          }
                          return null;
                        },
                        controller: _passwordTextController,
                        obscureText: _isPasswordVisible ? true : false,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          border: InputBorder.none,
                          hintText: "Create new password",
                          hintStyle: const TextStyle(
                              color: Color(0xFF616161),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //confirm password textfield
                    Container(
                      height: 60,
                      width: double.infinity,
                      padding:
                          const EdgeInsets.only(left: 60, top: 10, bottom: 10),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.length < 6) {
                            return 'Password must be greater than 6 Characters';
                          }
                          if (value != _passwordTextController.text) {
                            return 'Password does not match';
                          }
                          return null;
                        },
                        controller: _cPasswordTextController,
                        obscureText: _isPasswordVisible ? true : false,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          border: InputBorder.none,
                          hintText: "Confirm new password",
                          hintStyle: const TextStyle(
                              color: Color(0xFF616161),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //create account button
                    CustomButton(
                      text: "Create account",
                      onpress: () async {
                        if (_formKey.currentState!.validate()) {
                          logger.i('validated');
                          try {
                            await Auth.account(
                              _emailTextController.text.trim(),
                              _passwordTextController.text,
                              AuthMode.register,
                            );
                            await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const PhoneVerification(),
                              ),
                            );
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setBool('isUserLoggedIn', true);
                          } on FirebaseAuthException catch (e) {
                            logger.e(e);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(e.message!),
                            ));
                          }
                        }
                      },
                      hasBorder: true,
                      buttonColor: Colors.black,
                      fontSize: 12,
                      height: 60,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const CustomText(
                      text: "OR",
                      textAlign: TextAlign.center,
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    // const SizedBox(
                    //   height: 30,
                    // ),
                    GestureDetector(
                      child: const Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(children: [
                          TextSpan(
                              text: 'Dont have an account?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              )),
                          TextSpan(
                              text: ' Log in',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              )),
                        ]),
                      ),
                      onTap: () => Navigator.pushNamed(context, "/signin"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
