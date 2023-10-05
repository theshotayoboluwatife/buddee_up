import 'package:BuddeeUp/custom_widgets/custom_button.dart';
import 'package:BuddeeUp/custom_widgets/custom_text.dart';
import 'package:BuddeeUp/helpers/auth.dart';
import 'package:BuddeeUp/helpers/fire_store.dart';
import 'package:BuddeeUp/helpers/logger.dart';
import 'package:BuddeeUp/main.dart';
import 'package:BuddeeUp/models/new_user.dart';
import 'package:BuddeeUp/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  bool _isPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailTextController.dispose();
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
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Container(
                      height: 60,
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (!(EmailValidator.validate(
                                _emailTextController.text.trim()))) {
                              return 'Input a valid email';
                            }
                            return null;
                          },
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
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
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
                          hintText: "password",
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
                    CustomButton(
                      text: "Sign in",
                      onpress: () async {
                        if (_formKey.currentState!.validate()) {
                          logger.i('validated');
                          try {
                            await Auth.account(
                              _emailTextController.text.trim(),
                              _passwordTextController.text,
                              AuthMode.login,
                            );
                            await Navigator.of(context).pushNamedAndRemoveUntil(
                                '/home_screen', (route) => false);
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setBool('isUserLoggedIn', true);
                          } on FirebaseAuthException catch (e) {
                            logger.e(e);
                            ScaffoldMessenger.of(context)
                                .removeCurrentSnackBar();

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
                    Container(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          try {
                            await Auth.signInWithGoogle();
                            logger.i(auth.currentUser!.photoURL);
                            await FireStore().addUserToDatabase(
                              NewUser(
                                email: auth.currentUser!.email ?? '',
                                id: auth.currentUser!.uid,
                                status: '',
                                phoneNumber:
                                    auth.currentUser!.phoneNumber ?? '',
                                profileName:
                                    auth.currentUser!.displayName ?? '',
                                age: 18,
                                imageUrl: auth.currentUser!.photoURL ??
                                    'https://www.nicepng.com/png/full/933-9332131_profile-picture-default-png.png',
                                bio: '',
                                pictures: [auth.currentUser!.photoURL ?? ''],
                                height: '5 ft 10',
                                weight: 130,
                                gender: '',
                                tribe: '',
                                bodyType: '',
                                ethnicity: '',
                                lookingFor: '',
                                healthStatus: '',
                                activities: [],
                                sexualPreferences: '',
                                lastSeen: Timestamp.fromDate(DateTime.now()),
                              ).toJson(),
                            );

                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setBool('isUserLoggedIn', true);

                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (_) => const HomeScreen(),
                              ),
                              (route) => false,
                            );
                          } on FirebaseAuthException catch (e) {
                            logger.e(e);
                            ScaffoldMessenger.of(context)
                                .removeCurrentSnackBar();

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.message!),
                              ),
                            );
                          } catch (e) {
                            logger.e(e);
                            ScaffoldMessenger.of(context)
                                .removeCurrentSnackBar();

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.toString()),
                              ),
                            );
                          }
                        },
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                              "assets/images/flat-color-icons_google.png"),
                        ),
                        label: const CustomText(
                          text: "Sign In with Google",
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFDA3EE8),
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    //Facebook signin button
                    Container(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton.icon(
                        // onPressed: () async {
                        //   try {
                        //     await Auth.signInWithFacebook().then((value) =>
                        //         Navigator.of(context).pushAndRemoveUntil(
                        //           MaterialPageRoute(
                        //             builder: (_) => const HomeScreen(),
                        //           ),
                        //           (route) => false,
                        //         ));
                        //     final SharedPreferences prefs =
                        //         await SharedPreferences.getInstance();
                        //     prefs.setBool('isUserLoggedIn', true);
                        //   } on FirebaseAuthException catch (e) {
                        //     logger.e(e);
                        //     ScaffoldMessenger.of(context)
                        //         .removeCurrentSnackBar();

                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //       SnackBar(
                        //         content: Text(e.message!),
                        //       ),
                        //     );
                        //   }
                        // },
                        onPressed: () {},
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              Image.asset("assets/images/logos_facebook.png"),
                        ),
                        label: const CustomText(
                          text: "Sign Up with Facebook",
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFDA3EE8),
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    const Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(children: [
                        TextSpan(
                            text: 'By creating an account, you agree to our ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            )),
                        TextSpan(
                            text: 'Terms of service ',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            )),
                        TextSpan(
                            text: 'and',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            )),
                        TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            )),
                      ]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
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
                              text: ' Sign Up',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              )),
                        ]),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/signup");
                      },
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
