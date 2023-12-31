import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';

class PushNotificationSettings extends StatefulWidget {
  const PushNotificationSettings({Key? key}) : super(key: key);

  @override
  State<PushNotificationSettings> createState() => _PushNotificationSettingsState();
}

class _PushNotificationSettingsState extends State<PushNotificationSettings> {
  bool switchValue = true;
  bool switchValue2 = true;
  bool switchValue3 = false;
  bool switchValue4 = false;
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
          text: "Push notifications",
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),

            generateNotifContainer('Messages', 'Someone sent you a message'),
            generateNotifContainer('Message likes', 'Someone liked your message'),
            generateNotifContainer('In-app vibrations', ''),
            generateNotifContainer('In-app sounds', ''),
          ],
        ),
      ),
    );
  }

  Container generateNotifContainer(String title, String subtitle) {
    return Container(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: title,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                        CustomText(
                          text: subtitle,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ],
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
              );
  }
}
