import 'package:flutter/material.dart';

import '../custom_widgets/custom_text.dart';

class EmailUnsubscribe extends StatefulWidget {
  const EmailUnsubscribe({Key? key}) : super(key: key);

  @override
  State<EmailUnsubscribe> createState() => _EmailUnsubscribeState();
}

class _EmailUnsubscribeState extends State<EmailUnsubscribe> {
  bool switchValue = true;
  bool switchValue2 = true;
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
          text: "Email",
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
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 8),
              child: CustomText(
                text: "Email",
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left:16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'johnsmith@gmail.com',
                        hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.check, color: Colors.blue,)
                ],
              ),

              decoration: BoxDecoration(
                  color: Color(0xFF141416),
                  border: Border(
                      top: BorderSide(width: 1, color: Colors.white),
                      bottom: BorderSide(width: 1, color: Colors.white))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 24, top: 4),
              child: CustomText(
                text: "Your email is verified",
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/location_settings_screen");
                },
                child: CustomText(
                  text: "Send email Verification",
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
                decoration: BoxDecoration(
                    color: Color(0xFF141416),
                    border: Border(
                        top: BorderSide(width: 1, color: Colors.white),
                        bottom: BorderSide(width: 1, color: Colors.white)))

            ),
            Spacer(),
            generateSwitchContainer('New messages', switchValue),
            generateSwitchContainer('Promotions\nI want to receive news, updates and offers from BUDDEEUP', switchValue2),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 8,top:8, right: 20),
              child: CustomText(
                text: "Control the emails you want to get - all of them, just the important stuff or the bare minimum. You can always unsubscribe at the bottom of any email",
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),

            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/push_notification_settings");
                },
                child: CustomText(
                  text: "Unsubscribe from all",
                  color: Colors.purpleAccent,
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

            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
  Container generateSwitchContainer(String title, bool switchValue) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(left:16, right: 16, top: 4,bottom: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomText(
                text: title,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            Switch(
              value: this.switchValue,
              onChanged: (newValue) {
                setState(() {
                  this.switchValue = newValue;
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
                bottom:
                BorderSide(width: 1, color: Colors.white))),
      );
  }

}
