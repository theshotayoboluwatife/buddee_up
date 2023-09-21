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
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          color: Colors.purpleAccent,
          onPressed: () {},
        ),
        title: const CustomText(
          text: "Username",
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontSize: 18,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: CustomText(text: "Confirm", fontWeight: FontWeight.w400,fontSize: 18,),
          )
        ],
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
              text: "USERNAME",
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
                child: const Row(
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
              ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/email_unsubscribe");
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
                text: "Delete",
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
