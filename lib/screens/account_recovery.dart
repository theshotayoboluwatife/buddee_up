import 'package:BuddeeUp/custom_widgets/custom_button.dart';
import 'package:BuddeeUp/custom_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/custom_text.dart';

class AccountRecovery extends StatelessWidget {
  AccountRecovery({Key? key}) : super(key: key);

  TextEditingController _textController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SafeArea(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {},
                      iconSize: 40,
                      icon: Icon(Icons.arrow_back_outlined),
                      color: Colors.white,
                    ))),
            CustomText(
              text: "Account recovery",
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
            Spacer(),
            CustomTextField(fieldName: "Your email address" , myController: _textController),
            SizedBox(
              height: 20,
            ),
            CustomText(
              text:
              "we’ll email you with a link that will instantly recover your account",
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            CustomButton(
              text: "CONTINUE",
              onpress: () {},
              textColor: Colors.black,
            ),

            //Spacer()
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
    );
  }
}
