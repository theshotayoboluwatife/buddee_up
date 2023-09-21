import 'package:flutter/material.dart';

import '../custom_widgets/custom_text.dart';
class ConnectedAccountScreen extends StatefulWidget {
  const ConnectedAccountScreen({Key? key}) : super(key: key);

  @override
  State<ConnectedAccountScreen> createState() => _ConnectedAccountScreenState();
}

class _ConnectedAccountScreenState extends State<ConnectedAccountScreen> {
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
        icon: const Icon(Icons.arrow_back_ios_new_sharp),
        color: Colors.purpleAccent,
        onPressed: () {},
      ),
      title: const CustomText(
        text: "Connected accounts",
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
              text: "SIGN IN QUICKER BY LINKING YOUR ACCOUNT",
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      text: "Sign in with Instagram",
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
              ),
          Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                    color: Color(0xFF141416),
                    border: Border(
                        top: BorderSide(width: 1, color: Colors.white),
                        bottom: BorderSide(width: 1, color: Colors.white))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      text: "Sign in with Facebook",
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
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
              ),
          //Remember to Remove these 2 widgets, for prototype sake only
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/email_verification_settings");
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
    );
  }
}
