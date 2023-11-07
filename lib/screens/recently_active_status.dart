import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';

class RecentlyActiveStatus extends StatefulWidget {
  const RecentlyActiveStatus({Key? key}) : super(key: key);

  @override
  State<RecentlyActiveStatus> createState() => _RecentlyActiveStatusState();
}

class _RecentlyActiveStatusState extends State<RecentlyActiveStatus> {
  bool switchValue = true;
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
          text: "Recently active status",
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
                      text: "Show activity status",
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

        ],
      ),
    );
  }
}
