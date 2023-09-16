import 'package:BuddeeUp/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/custom_button.dart';

class LoginSignUp extends StatelessWidget {
  const LoginSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.purple,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
              children: [
                Spacer(),
                Image(image: AssetImage("assets/images/buddee_up_logo.png"), width:214, height: 212,),
                SizedBox(height: 20,),
                CustomText(text: "BUDDEEUP",fontSize: 40, fontWeight: FontWeight.bold,),
                SizedBox(height: 20,),
                CustomButton(text: "Create Account", onpress: ()=> Navigator.pushNamed(context, '/signup'), hasBorder: true, buttonColor: Colors.black,),
                SizedBox(height: 20,),
                CustomButton(text: "Sign In", onpress: ()=> Navigator.pushNamed(context, '/signin'), buttonColor: Color(0xFFDA3EE8),),
                SizedBox(height: 40,),
                GestureDetector(child: CustomText(text: "Trouble signing in?", fontSize: 14,fontWeight: FontWeight.bold,),
                onTap: ()=> Navigator.pushNamed(context, '/account_recovery'),),
                Spacer()
              ],
            ),
          decoration: BoxDecoration(
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
          ),
      ),
    );
  }
}
