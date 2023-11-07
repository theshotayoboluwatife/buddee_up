import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';

class ReadReceiptsSettings extends StatefulWidget {
  const ReadReceiptsSettings({Key? key}) : super(key: key);

  @override
  State<ReadReceiptsSettings> createState() => _ReadReceiptsSettingsState();
}

class _ReadReceiptsSettingsState extends State<ReadReceiptsSettings> {
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
          text: "Manage Read Receipts",
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
                      text: "Send Read Receipts",
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
          const Padding(padding: EdgeInsets.all(20.0),
          child:
            CustomText(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              text: "Turning this off will prevent any matches from activating Read Receipts in your conversation from this moment forward",
            ),),

        ],
      ),
    );
  }
}
