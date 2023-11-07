import 'package:BuddeeUp/widgets/account_tile.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';

class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(227, 127, 236, 0.96),
                // rgba(227.15, 126.78, 235.88, 0.96)
                Color.fromRGBO(196, 32, 210, 0.96),
                // rgba(196.07, 31.56, 210.37, 0.96)
                Color.fromRGBO(163, 11, 176, 0.96),
                // rgba(163.15, 11.02, 176.37, 0.96)
              ],
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/buddee_up_logo.png",
                    height: 50,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomText(
                    text: "Choose an account",
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                  const CustomText(
                    text: "to continue to BUDDEEUP",
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    child: AccountTile(
                        name: "Lara Mueller",
                        email: "laramueller@gmail.com",
                        image: Image.asset("assets/images/User1.png")),
                    onTap: (){
                      Navigator.pushNamed(context, "/phone_verification");
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    child: AccountTile(
                        name: "Cameron Williamson",
                        email: "cameronwilliamson@gmail.com",
                        image: Image.asset("assets/images/User2.png")),
                    onTap: (){        Navigator.pushNamed(context, "/phone_verification");
                    },
                  ),
                  const Spacer(),
                  const Text.rich(
                    textAlign: TextAlign.start,
                    TextSpan(children: [
                      TextSpan(
                          text:
                              'To continue, Google will share your name, email address, and profile picture with BUDDEEUP, Before using this app, review its ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          )),
                      TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          )),
                      TextSpan(
                          text: ' and ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          )),
                      TextSpan(
                          text: ' terms and service',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          )),
                    ]),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
