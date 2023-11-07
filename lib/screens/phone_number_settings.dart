import 'package:BuddeeUp/widgets/custom_text.dart';
import 'package:BuddeeUp/helpers/logger.dart';
import 'package:BuddeeUp/main.dart';
import 'package:BuddeeUp/providers/create_new_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PhoneNumberSettings extends StatelessWidget {
  final TextEditingController numberController = TextEditingController();

  PhoneNumberSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateNewUser newUser = Provider.of<CreateNewUser>(context);

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
            child: TextField(
              style: const TextStyle(color: Colors.white),
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "+123456789",
                hintStyle: const TextStyle(color: Colors.white54),
                suffixIcon: const Icon(Icons.check, color: Colors.blue),
                border: InputBorder.none,
                labelStyle: GoogleFonts.poppins(
                  color: Colors.white54,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
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
              onPressed: () async {
                try {
                  if (numberController.text.trim().length >= 10 &&
                      numberController.text.trim().length <= 18) {
                    CollectionReference users =
                        FirebaseFirestore.instance.collection('users');
                    DocumentReference userDoc =
                        users.doc(auth.currentUser!.uid);
                    // Update the field
                    await userDoc.update({
                      'phoneNumber': numberController.text
                          .trim(), // Replace 'fieldName' with your field name
                    });
                    logger.i('Field updated successfully');
                    newUser.newUser.phoneNumber = numberController.text.trim();
                    newUser.update();
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invalid phone number'),
                      ),
                    );
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Error Updating Phone Number'),
                    ),
                  );
                  logger.i('Error updating field: $e');
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 12), // Adjust button size
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
