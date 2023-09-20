import 'package:flutter/material.dart';

import '../custom_widgets/custom_text.dart';

class AddContactsScreen extends StatelessWidget {
  const AddContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          color: Colors.purpleAccent,
          onPressed: () {},
        ),
        title: CustomText(
          text: "Add Contacts",
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontSize: 18,
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
              child: CustomText(text: "DONE", fontWeight: FontWeight.bold, fontSize: 15,))
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
                text: "Full NAME",
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),

            Container(
                  width: double.infinity,
                  color: Color(0XFF141416),
                  padding: EdgeInsets.only(left:16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter name',
                      hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                      border: InputBorder.none,
                    ),
                  ),
                ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: "CONTACT INFO", fontWeight: FontWeight.bold,fontSize: 15,),
                  SizedBox(height: 10,),
                  CustomText(text: "Add a phone number or email", fontWeight: FontWeight.w400,fontSize: 15,),
                  SizedBox(height: 10,)
              ],),
            ),
            Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Add a phone number',
                      hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                      border: InputBorder.none,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFF141416),
                      border: Border(
                          top: BorderSide(width: 1, color: Colors.white),
                          left: BorderSide(width: 1, color: Colors.white),
                          right: BorderSide(width: 1, color: Colors.white),
                          bottom: BorderSide(width: 1, color: Colors.white))),
                ),
            SizedBox(
              height: 30,
            ),
            Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Add email',
                      hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                      border: InputBorder.none,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xFF141416),
                      border: Border(
                          top: BorderSide(width: 1, color: Colors.white),
                          left: BorderSide(width: 1, color: Colors.white),
                          right: BorderSide(width: 1, color: Colors.white),
                          bottom: BorderSide(width: 1, color: Colors.white))),
                ),
            SizedBox(height: 50,),
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/read_receipts_settings");
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
