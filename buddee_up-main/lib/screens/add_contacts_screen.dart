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
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          color: Colors.purpleAccent,
          onPressed: () {},
        ),
        title: const CustomText(
          text: "Add Contacts",
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontSize: 18,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16),
              child: const CustomText(text: "DONE", fontWeight: FontWeight.bold, fontSize: 15,))
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, bottom: 8),
              child: CustomText(
                text: "Full NAME",
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),

            Container(
                  width: double.infinity,
                  color: const Color(0XFF141416),
                  padding: const EdgeInsets.only(left:16.0),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter name',
                      hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                      border: InputBorder.none,
                    ),
                  ),
                ),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
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
                  padding: const EdgeInsets.only(left: 16),
                  decoration: const BoxDecoration(
                      color: Color(0xFF141416),
                      border: Border(
                          top: BorderSide(width: 1, color: Colors.white),
                          left: BorderSide(width: 1, color: Colors.white),
                          right: BorderSide(width: 1, color: Colors.white),
                          bottom: BorderSide(width: 1, color: Colors.white))),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Add a phone number',
                      hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                      border: InputBorder.none,
                    ),
                  ),
                ),
            const SizedBox(
              height: 30,
            ),
            Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 16),
                  decoration: const BoxDecoration(
                      color: Color(0xFF141416),
                      border: Border(
                          top: BorderSide(width: 1, color: Colors.white),
                          left: BorderSide(width: 1, color: Colors.white),
                          right: BorderSide(width: 1, color: Colors.white),
                          bottom: BorderSide(width: 1, color: Colors.white))),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Add email',
                      hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                      border: InputBorder.none,
                    ),
                  ),
                ),
            const SizedBox(height: 50,),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/read_receipts_settings");
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Adjust button size
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // No border curves
                  ),
                  backgroundColor: const Color(0xFF141416),

                  // Text color
                ),
                child: const CustomText(
                  text: "next",
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),

            )
          ],
        ),
      ),
    );
  }
}
