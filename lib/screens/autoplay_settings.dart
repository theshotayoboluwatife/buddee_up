import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';

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
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          color: Colors.purpleAccent,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const CustomText(
          text: "Autoplay Videos",
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
            padding: EdgeInsets.only(left: 20.0,right: 8, bottom: 4),
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
                      text: "On Wi-fi and mobile data",
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    Icon(Icons.check, color: Colors.purpleAccent,)
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "On Wi-fi only",
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Never autoplay Videos",
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),

                  ],
                ),
              ),

        ],
      ),
    );
  }
}
