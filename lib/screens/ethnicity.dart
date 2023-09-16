import 'package:flutter/material.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_text.dart';

class Ethnicity extends StatelessWidget {
  const Ethnicity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SafeArea(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_outlined),
                      color: Colors.white,
                    ),
                    CustomText(text: "Ethnicity", fontSize: 40, fontWeight: FontWeight.w600,)
                  ]),
            ),
            SizedBox(height: 40,),
            CustomText(text: "Select Ethnic group", fontSize: 20, fontWeight: FontWeight.w400,),
            SizedBox(height: 10,),
            Container(),
            Spacer(),
            CustomButton(text: "CONTINUE", onpress: (){}, width: double.infinity,buttonColor: Colors.white,),
            Spacer()
          ],
        ),
      ),
    );
  }
}
