import 'package:BuddeeUp/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/custom_text.dart';

class KeepMePosted extends StatelessWidget {
  const KeepMePosted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
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
            SizedBox(height: 30,),
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(child: Image.asset("assets/images/Ellipse4.png")),
                Positioned(
                  child: Image.asset("assets/images/Frame4.png"),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              text: "Keep me posted",
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              text:
              "Find out when you get a message",
              fontSize: 15,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            CustomButton(
              text: "I WANT TO BE NOTIFIED",
              onpress: () {},
              textColor: Colors.black,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "TELL ME MORE",
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down_outlined), color: Colors.white,
                  iconSize: 30,)
              ],
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
