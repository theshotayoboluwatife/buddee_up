import 'package:BuddeeUp/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../custom_widgets/custom_text_field.dart';

class PhoneNumberSettings extends StatelessWidget {
  const PhoneNumberSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          color: Colors.purpleAccent,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const CustomText(
          text: "Phone number",
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, bottom: 8),
            child: CustomText(
              text: "PHONE NUMBER",
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                    color: Color(0xFF141416),
                    border: Border(
                        top: BorderSide(width: 1, color: Colors.white),
                        bottom: BorderSide(width: 1, color: Colors.white))),
                child:   TextField(
                  style:  const TextStyle(color: Colors.white
                  ),
                  controller: null,
                  decoration: InputDecoration(
                    hintText: "+234567890876",
                    hintStyle:  const TextStyle(color: Colors.white54),
                    suffixIcon:  const Icon(Icons.check,color: Colors.blue),
                      border:InputBorder.none,
                    labelStyle: GoogleFonts.poppins(color: Colors.white54, fontSize: 15, fontWeight: FontWeight.w500),

                  ),
                ),
              ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
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
                text: "Update phone number",
                color: Colors.purpleAccent,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),

          )
        ],
      ),
    );
  }
}
