import 'package:flutter/material.dart';

import '../custom_widgets/custom_text.dart';

class UsernameSettings extends StatelessWidget {
  const UsernameSettings({Key? key}) : super(key: key);

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
          text: "Username",
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontSize: 18,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: CustomText(text: "Confirm", fontWeight: FontWeight.w400,fontSize: 18,),
          )
        ],
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
                text: "USERNAME",
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "@johnsmith",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
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
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/email_unsubscribe");
                },
                child: CustomText(
                  text: "Delete",
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

            )
          ],
        ),
      ),
    );
  }
}
