import 'package:flutter/material.dart';

import '../custom_widgets/custom_text.dart';

class AutoplaySettings extends StatelessWidget {
  const AutoplaySettings({Key? key}) : super(key: key);

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
          text: "Autoplay Videos",
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
              padding: const EdgeInsets.only(left: 20.0,right: 8, bottom: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Playing videos uses more data than displaying photos, so choose when videos autoplay here.",
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomText(
                    text: "AUTOPLAY OPTIONS",
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ],
              ),
            ),
            Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "On Wi-fi and mobile data",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      Icon(Icons.check, color: Colors.purpleAccent,)
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFF141416),
                      border: Border(
                          top: BorderSide(width: 1, color: Colors.white),
                          bottom: BorderSide(width: 1, color: Colors.white))),
                ),
            Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "On Wi-fi only",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),

                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFF141416),
                      border: Border(
                          top: BorderSide(width: 1, color: Colors.white),
                          bottom: BorderSide(width: 1, color: Colors.white))),
                ),
            Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Never autoplay Videos",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),

                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFF141416),
                      border: Border(
                          top: BorderSide(width: 1, color: Colors.white),
                          bottom: BorderSide(width: 1, color: Colors.white))),
                ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/online_now_screen");
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
