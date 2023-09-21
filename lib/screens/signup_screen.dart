import 'package:BuddeeUp/custom_widgets/custom_button.dart';
import 'package:BuddeeUp/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _cPasswordTextController = TextEditingController();
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
            Expanded(
              child: ListView(
                children: [
                  //email adress textfield
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

                  //password textfield
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
                          hintText: "Create new password",
                          hintStyle: const TextStyle(
                              color: Color(0xFF616161),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //confirm password textfield
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 60, top: 10, bottom: 10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: TextFormField(
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
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //create account button
                  CustomButton(
                    text: "Create account",
                    onpress: () {},
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

                  //Google signin button
                  Container(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton.icon(
                      onPressed: ()=> Navigator.pushNamed(context, "/google_signin"),
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                            "assets/images/flat-color-icons_google.png"),
                      ),
                      label: const CustomText(
                        text: "Sign Up with Google",
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

                  //Facebook signin button
                  Container(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton.icon(
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

                  //Instagram sigin button
                  Container(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/images/instagram1.png"),
                      ),
                      label: const CustomText(
                        text: "Sign Up with Instagram",
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
                    height: 20,
                  ),
                  const Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                        children: [
                          TextSpan(
                              text: 'By creating an account, you agree to our ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              )
                          ),
                          TextSpan(
                              text: 'Terms of service ',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              )
                          ),
                          TextSpan(
                              text: 'and',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              )
                          ),
                          TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              )
                          ),
                        ]

                    ),


                  ),
                  const SizedBox(height: 30,),
                  const Text.rich(
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
                            text: ' Log in',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            )
                        ),
                      ]

                    ),


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
