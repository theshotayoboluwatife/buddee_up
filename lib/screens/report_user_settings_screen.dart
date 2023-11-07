import 'package:BuddeeUp/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';

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
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
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
            const SizedBox(height: 5,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: "Anabelle", fontWeight: FontWeight.w500, fontSize: 15, ),
                SizedBox(width: 5,),
                Icon(Icons.verified, color: Colors.purpleAccent ,)
              ],
            ),
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(text: "Unlock Private Album For Her", fontWeight: FontWeight.w500, fontSize: 15, ),
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
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(text: "Pin Chat", fontWeight: FontWeight.w500, fontSize: 15, ),
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
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(text: "Mute", fontWeight: FontWeight.w500, fontSize: 15, ),
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
            const SizedBox(height: 10,),
            const CustomText(text: "Clear Chat History", fontWeight: FontWeight.w500, fontSize: 15, ),
            const SizedBox(height: 10,),
            const CustomText(text: "Block", fontWeight: FontWeight.w500, fontSize: 15, ),
            const SizedBox(height: 20,),
            CustomButton(text: "Report", onpress: (){Navigator.pushNamed(context, "/phone_number_settings");}, buttonColor: const Color(0xFF141416), hasBorder: true,),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
