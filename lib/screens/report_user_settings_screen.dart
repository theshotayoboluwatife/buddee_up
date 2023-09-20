import 'package:BuddeeUp/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/custom_text.dart';

class ReportUserScreen extends StatefulWidget {
  const ReportUserScreen({Key? key}) : super(key: key);

  @override
  State<ReportUserScreen> createState() => _ReportUserScreenState();
}

class _ReportUserScreenState extends State<ReportUserScreen> {
  bool switchValue = false;
  bool switchValue2 = false;
  bool switchValue3 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
      Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/annabelle.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: "Anabelle", fontWeight: FontWeight.w500, fontSize: 15, ),
                SizedBox(width: 5,),
                Icon(Icons.verified, color: Colors.purpleAccent ,)
              ],
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Unlock Private Album For Her", fontWeight: FontWeight.w500, fontSize: 15, ),
                Switch(
                  value: switchValue2,
                  onChanged: (newValue) {
                    setState(() {
                      switchValue2 = newValue;
                    });
                  },
                  activeTrackColor: Colors.purpleAccent,
                  activeColor: Colors.white,
                  inactiveTrackColor: Colors.black,
                  inactiveThumbColor: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Pin Chat", fontWeight: FontWeight.w500, fontSize: 15, ),
                Switch(
                  value: switchValue3,
                  onChanged: (newValue) {
                    setState(() {
                      switchValue3 = newValue;
                    });
                  },
                  activeTrackColor: Colors.purpleAccent,
                  activeColor: Colors.white,
                  inactiveTrackColor: Colors.black,
                  inactiveThumbColor: Colors.white,
                ),   ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Mute", fontWeight: FontWeight.w500, fontSize: 15, ),
                Switch(
                  value: switchValue2,
                  onChanged: (newValue) {
                    setState(() {
                      switchValue2 = newValue;
                    });
                  },
                  activeTrackColor: Colors.purpleAccent,
                  activeColor: Colors.white,
                  inactiveTrackColor: Colors.black,
                  inactiveThumbColor: Colors.white,
                ),   ],
            ),
            SizedBox(height: 10,),
            CustomText(text: "Clear Chat History", fontWeight: FontWeight.w500, fontSize: 15, ),
            SizedBox(height: 10,),
            CustomText(text: "Block", fontWeight: FontWeight.w500, fontSize: 15, ),
            SizedBox(height: 20,),
            CustomButton(text: "Report", onpress: (){Navigator.pushNamed(context, "/phone_number_settings");}, buttonColor: Color(0xFF141416), hasBorder: true,),
            Spacer()
          ],
        ),
      ),
    );
  }
}
