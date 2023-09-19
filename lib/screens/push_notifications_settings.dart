import 'package:flutter/material.dart';

import '../custom_widgets/custom_text.dart';

class PushNotificationSettings extends StatefulWidget {
  const PushNotificationSettings({Key? key}) : super(key: key);

  @override
  State<PushNotificationSettings> createState() => _PushNotificationSettingsState();
}

class _PushNotificationSettingsState extends State<PushNotificationSettings> {
  bool switchValue = true;
  bool switchValue2 = true;
  bool switchValue3 = false;
  bool switchValue4 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          color: Colors.purpleAccent,
          onPressed: () {},
        ),
        title: CustomText(
          text: "Push notifications",
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),

            Center(
              child: Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Messages",
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                          CustomText(
                            text: "Someone sent you a message",
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ],
                      ),
                      Switch(
                        value: switchValue,
                        onChanged: (newValue) {
                          setState(() {
                            switchValue = newValue;
                          });
                        },
                        activeTrackColor: Colors.purpleAccent,
                        activeColor: Colors.white,
                        inactiveTrackColor: Colors.black,
                        inactiveThumbColor: Colors.white,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFF141416),
                      border: Border(
                          top: BorderSide(width: 1, color: Colors.white),
                          bottom: BorderSide(width: 1, color: Colors.white))),
                ),
              ),
            ),
            Center(
              child: Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Messages likes",
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                          CustomText(
                            text: "Someone liked your message",
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ],
                      ),
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
                  decoration: BoxDecoration(
                      color: Color(0xFF141416),
                      border: Border(
                          top: BorderSide(width: 1, color: Colors.white),
                          bottom: BorderSide(width: 1, color: Colors.white))),
                ),
              ),
            ),
            Center(
              child: Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                            text: "In-app vibrations",
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
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
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFF141416),
                      border: Border(
                          top: BorderSide(width: 1, color: Colors.white),
                          bottom: BorderSide(width: 1, color: Colors.white))),
                ),
              ),
            ),
            Center(
              child: Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "In-app sounds",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      Switch(
                        value: switchValue4,
                        onChanged: (newValue) {
                          setState(() {
                            switchValue4 = newValue;
                          });
                        },
                        activeTrackColor: Colors.purpleAccent,
                        activeColor: Colors.white,
                        inactiveTrackColor: Colors.black,
                        inactiveThumbColor: Colors.white,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFF141416),
                      border: Border(
                          top: BorderSide(width: 1, color: Colors.white),
                          bottom: BorderSide(width: 1, color: Colors.white))),
                ),
              ),
            ),

            //Remember to Remove these 2 widgets, for prototype sake only
            /*SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/email_verification_settings");
                },
                child: CustomText(
                  text: "next",
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Adjust button size
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // No border curves
                  ),
                  backgroundColor: Color(0xFF141416),

                  // Text color
                ),
              ),

            )*/
          ],
        ),
      ),
    );
  }
}
