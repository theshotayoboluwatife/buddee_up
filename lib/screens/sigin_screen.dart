import 'package:BuddeeUp/custom_widgets/custom_button.dart';
import 'package:BuddeeUp/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  bool _isPasswordVisible = false;

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
              Color.fromRGBO(227, 127, 236, 0.96), // rgba(227.15, 126.78, 235.88, 0.96)
              Color.fromRGBO(196, 32, 210, 0.96), // rgba(196.07, 31.56, 210.37, 0.96)
              Color.fromRGBO(163, 11, 176, 0.96), // rgba(163.15, 11.02, 176.37, 0.96)
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
            const SizedBox(height: 30,),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: TextFormField(
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
                    padding: const EdgeInsets.only(left: 60, top: 10, bottom: 10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: TextFormField(
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
                        )),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: "Sign in",
                    onpress: () {
                      Navigator.pushNamed(context, '/discover_screen');
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
                      onPressed: () {
                        Navigator.pushNamed(context, "/discover_screen");
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
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, "/discover_screen");
                      },
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                        Image.asset("assets/images/logos_facebook.png"),
                      ),
                      label: const CustomText(
                        text: "Sign In with Facebook",
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

                  const SizedBox(height: 30,),
                  GestureDetector(
                    child: const Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                          children: [
                            TextSpan(
                                text: 'Dont have an account?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                )
                            ),
                            TextSpan(
                                text: ' Sign Up',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                )
                            ),
                          ]

                      ),


                    ),
                    onTap: (){
                      Navigator.pushNamed(context, "/signup");
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
