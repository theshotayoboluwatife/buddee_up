import 'package:flutter/material.dart';

import '../custom_widgets/custom_text.dart';

class OnlineNowScreen extends StatefulWidget {
  const OnlineNowScreen({Key? key}) : super(key: key);

  @override
  State<OnlineNowScreen> createState() => _OnlineNowScreenState();
}

class _OnlineNowScreenState extends State<OnlineNowScreen> {
  bool switchValue = true;
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
          text: "Online now",
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
                      CustomText(
                        text: "Show online now status",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
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
            Padding(padding: EdgeInsets.all(20.0),
              child:
              CustomText(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                text: "Allow “online now” status to be displayed on your profile while you are using BUDDEEUP",
              ),),

            //Remember to Remove these 2 widgets. For prototype sake only
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/recently_active_status");
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

            )
          ],
        ),
      ),
    );
  }
}
