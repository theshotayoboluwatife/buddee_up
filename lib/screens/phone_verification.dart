import 'package:BuddeeUp/custom_widgets/custom_button.dart';
import 'package:BuddeeUp/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhoneVerification extends StatelessWidget {
  const PhoneVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            SafeArea(
              child: Row(

                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.keyboard_backspace_outlined, size: 30),
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CustomText(
                    text: "Phone verification",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),

            ClipRRect(
              child: IntlPhoneField(
                  decoration: InputDecoration(
                        hintText: "Enter your mobile number",
                        counterText: '',
                        border:  InputBorder.none,
                        filled: true,
                        fillColor: Colors.white, // Background color
                      ),
                      initialCountryCode: 'US',
                      onChanged: (PhoneNumber phoneNumber) {

                      },
              ),
               borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            SizedBox(
              height: 30,
            ),
            CustomText(
              text:
                  "When you tap Continue, BUDDEEUP will send a verification code. Message and data rates may apply. The verified phone number can be used to login. Learn what happens when your number changes",
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
            SizedBox(height: 50,),
            CustomButton(text: "CONTINUE", onpress: (){}, buttonColor: Colors.white, textColor: Colors.black,),
          ],
        ),
        decoration: BoxDecoration(
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
      ),
    );
  }
}
