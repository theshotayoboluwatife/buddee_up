import 'package:BuddeeUp/widgets/custom_button.dart';
import 'package:BuddeeUp/widgets/custom_text.dart';
import 'package:BuddeeUp/helpers/auth.dart';
import 'package:BuddeeUp/helpers/logger.dart';
import 'package:BuddeeUp/providers/create_new_user.dart';
import 'package:BuddeeUp/screens/phone_verification.dart';
import 'package:BuddeeUp/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
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
  bool _isPasswordNotVisible = true;

  bool isLoggedInSelected = false;

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
    final createNewUser = Provider.of<CreateNewUser>(context);
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
                        obscureText: _isPasswordNotVisible ? true : false,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordNotVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordNotVisible = !_isPasswordNotVisible;
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
                        obscureText: _isPasswordNotVisible ? true : false,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordNotVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordNotVisible = !_isPasswordNotVisible;
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
                    isLoggedInSelected
                        ? Center(
                            child: LoadingAnimationWidget.staggeredDotsWave(
                              color: Colors.white,
                              size: 45,
                            ),
                            )
                        : CustomButton(
                            text: "Create account",
                            onpress: () async {
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  isLoggedInSelected = true;
                                });
                                logger.i('validated');
                                try {
                                  createNewUser.setEmail(
                                      _emailTextController.text.trim());
                                  await Auth.account(
                                    _emailTextController.text.trim(),
                                    _passwordTextController.text,
                                    AuthMode.register,
                                  );
                                  await Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => const PhoneVerification(),
                                      // builder: (_) => ProfileScreen(),
                                    ),
                                  );
                                } on FirebaseAuthException catch (e) {
                                  logger.e(e);
                                  ScaffoldMessenger.of(context)
                                      .removeCurrentSnackBar();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(e.message!),
                                  ));
                                  setState(() {
                                    isLoggedInSelected = false;
                                  });
                                }
                                setState(() {
                                  isLoggedInSelected = false;
                                });
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
                              text: 'Do you have an account?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              )),
                          TextSpan(
                              text: 'Log in',
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
