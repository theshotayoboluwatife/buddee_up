import 'package:BuddeeUp/helpers/auth.dart';
import 'package:BuddeeUp/screens/blocked_accounts.dart';
import 'package:BuddeeUp/screens/sigin_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../custom_widgets/custom_text.dart';
import '../providers/location_provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  double _sliderValue = 0.0;
  double _startValue = 25.0;
  double _endValue = 75.0;
  bool switchValue0 = true;
  bool switchValue1 = true;
  bool switchValue2 = true;
  bool switchValue3 = true;
  bool switchValue4 = true;

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.black,
        title: const CustomText(
          text: "Settings",
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: const Color(0xff141416),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        minRadius: 40,
                        child: Icon(
                          Icons.rocket_launch,
                          color: Colors.purpleAccent,
                          size: 35,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Get Boosts",
                        color: Colors.purpleAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: const Color(0xff141416),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        minRadius: 40,
                        child: Image.asset("assets/images/incognito.png",
                            width: 30, height: 30, fit: BoxFit.cover),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomText(
                        text: "Get Incognito",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const CustomText(
            text: "ACCOUNT SETTINGS",
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xff141416),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      text: "Phone number",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    Row(
                      children: [
                        const CustomText(
                          text: "+1234567890",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, "/phone_number_settings");
                            },
                            icon: const Icon(
                              Icons.navigate_next,
                              color: Colors.white,
                            ))
                      ],
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Divider(
                    color: Colors.white,
                    height: 1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      text: "Connected accounts",
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/connected_accounts");
                        },
                        icon: const Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                        ))
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Divider(
                    color: Colors.white,
                    height: 1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      text: "Email",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: "Johnsmith@gmail.com",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.purpleAccent[100],
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, "/email_verification_settings");
                            },
                            icon: const Icon(
                              Icons.navigate_next,
                              color: Colors.white,
                            ))
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const CustomText(
            text: "Verify an email to help secure your account",
            color: Colors.purpleAccent,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xff141416),
            ),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: "Location",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: locationProvider.location,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, "/location_settings_screen");
                          },
                          icon: const Icon(
                            Icons.navigate_next,
                            color: Colors.white,
                          ))
                    ],
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Divider(
                  color: Colors.white,
                  height: 1,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CustomText(
                      text: "Distance preference",
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  CustomText(
                    text: "50 mi",
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  )
                ],
              ),
              Slider(
                value: _sliderValue,
                onChanged: (newValue) {
                  setState(() {
                    _sliderValue = newValue;
                  });
                },
                min: 0.0, // Minimum value
                max: 100.0, // Maximum value
                divisions: 100, // Number of discrete divisions
                label: '$_sliderValue',
                activeColor: Colors.purpleAccent,
                thumbColor: Colors.white, // Label to display when dragging
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Divider(
                  color: Colors.white,
                  height: 1,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: "Show me",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  Row(
                    children: [
                      const CustomText(
                        text: "Everyone",
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/show_me_screen");
                          },
                          icon: const Icon(
                            Icons.navigate_next,
                            color: Colors.white,
                          ))
                    ],
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Divider(
                  color: Colors.white,
                  height: 1,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Age preference",
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  CustomText(
                    text: "20-28",
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              RangeSlider(
                values: RangeValues(_startValue, _endValue),
                onChanged: (RangeValues newValues) {
                  setState(() {
                    _startValue = newValues.start;
                    _endValue = newValues.end;
                  });
                },
                min: 0.0,
                max: 100.0,
                divisions: 100,
                labels: RangeLabels('$_startValue', '$_endValue'),
                activeColor: Colors.purpleAccent,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: "Global",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  Switch(
                    value: switchValue0,
                    onChanged: (newValue) {
                      setState(() {
                        switchValue0 = newValue;
                      });
                    },
                    activeTrackColor: Colors.purpleAccent,
                    activeColor: Colors.white,
                    inactiveTrackColor: Colors.black,
                    inactiveThumbColor: Colors.white,
                  ),
                ],
              )
            ]),
          ),
          const SizedBox(
            height: 50,
          ),
          const CustomText(
            text: "Active Status",
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 16,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xff141416),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                const Row(
                  children: [
                    CustomText(
                      text: "Recently active",
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.verified,
                      color: Colors.purpleAccent,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      text: "See the next recently active people first",
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                    Switch(
                      value: switchValue1,
                      onChanged: (newValue) {
                        setState(() {
                          switchValue1 = newValue;
                        });
                      },
                      activeTrackColor: Colors.purpleAccent,
                      activeColor: Colors.white,
                      inactiveTrackColor: Colors.black,
                      inactiveThumbColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const CustomText(
            text: "My visibility",
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 16,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xff141416),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Show me on BUDDEEUP",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(
                            text:
                                "Your profile will be seen on the discover page",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
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
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Divider(
                    color: Colors.white,
                    height: 1,
                  ),
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Don't Show me on BUDDEEUP",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(
                            text:
                                "Your profile will be seen on the discover page",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    Switch(
                      value: switchValue3,
                      onChanged: (newValue) {
                        setState(() {
                          switchValue3 = newValue;
                        });
                      },
                      activeTrackColor: Colors.purpleAccent,
                      activeColor: Colors.white,
                      inactiveTrackColor: Colors.black,
                      inactiveThumbColor: Colors.white,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Divider(
                    color: Colors.white,
                    height: 1,
                  ),
                ),
                Column(
                  children: [
                    const Row(
                      children: [
                        CustomText(
                          text: "Go Incognito",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.verified,
                          color: Colors.purpleAccent,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: "You will be seen by people you like",
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                        Switch(
                          value: switchValue4,
                          onChanged: (newValue) {
                            setState(() {
                              switchValue4 = newValue;
                            });
                          },
                          activeTrackColor: Colors.purpleAccent,
                          activeColor: Colors.white,
                          inactiveTrackColor: Colors.black,
                          inactiveThumbColor: Colors.white,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.only(top: 4, bottom: 4, right: 10, left: 16),
            color: const Color(0xFF141416),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: CustomText(
                    text: "Block contacts",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const BlockedContactsScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: CustomText(
              text:
                  "Select people from your contact list who you dont want to see or be seen on BUDDEEUP",
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const CustomText(
            text: "READ RECEIPTS",
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 16,
          ),
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.only(top: 4, bottom: 4, right: 10, left: 16),
            color: const Color(0xFF141416),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: CustomText(
                    text: "Manage Read Receipts",
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: [
                    const CustomText(
                      text: "Settings",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, "/read_receipts_settings");
                        },
                        icon: const Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                        ))
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const CustomText(
            text: "DATA USAGE",
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 16,
          ),
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.only(top: 4, bottom: 4, right: 10, left: 16),
            color: const Color(0xFF141416),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: CustomText(
                    text: "Autoplay Videos",
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/autoplay_videos_settings");
                    },
                    icon: const Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const CustomText(
            text: "ACTIVE STATUS",
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 16,
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 6, right: 6, bottom: 4, top: 4),
            color: const Color(0xff141416),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: CustomText(
                        text: "Online now",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/online_now_screen");
                        },
                        icon: const Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                        ))
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 4.0, right: 20),
                  child: Divider(
                    height: 1,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: CustomText(
                        text: "Recently active status",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, "/recently_active_status");
                        },
                        icon: const Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                        ))
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const CustomText(
            text: "PROFILE",
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 16,
          ),
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 24),
            color: const Color(0xFF141416),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: CustomText(
                    text: "Username",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/username_settings");
                    },
                    icon: const Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const CustomText(
            text: "Create a public username",
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 12,
          ),
          const SizedBox(
            height: 50,
          ),
          const CustomText(
            text: "NOTIFICATIONS",
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 16,
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
            color: const Color(0xff141416),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: CustomText(
                        text: "Email",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, "/unsubscribe_email_screen");
                        },
                        icon: const Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                        ))
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 2.0, right: 20),
                  child: Divider(
                    height: 1,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: CustomText(
                        text: "Push notifications",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, "/push_notification_settings");
                        },
                        icon: const Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                        ))
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 20),
            child: CustomText(
              text: "Pick which notifications to see while in the app",
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
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
                text: "Restore Purchases",
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
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
                text: "Share BUDDEEUP",
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const CustomText(
            text: "CONTACT US",
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 16,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 8),
            color: const Color(0xFF141416),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: CustomText(
                    text: "Help & support",
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const CustomText(
            text: "PRIVACY",
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 16,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: const Color(0xff141416),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomText(
                        text: "Cookie Policy",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    )
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 4.0, right: 4, top: 8, bottom: 8),
                  child: Divider(
                    color: Colors.white,
                    height: 1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomText(
                        text: "Privacy Policy",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    )
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 4.0, right: 4, top: 8, bottom: 8),
                  child: Divider(
                    color: Colors.white,
                    height: 1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomText(
                        text: "Licences",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    )
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 4.0, right: 4, top: 8, bottom: 8),
                  child: Divider(
                    color: Colors.white,
                    height: 1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomText(
                        text: "Terms of Service",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    Icon(
                      Icons.navigate_next,
                      color: Colors.white,
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: const Color(0xff141416),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    try {
                      await Auth.signOut();
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool('isUserLoggedIn', false);
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (_) => const SignIn(),
                          ),
                          (route) => false);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Error Logging Out'),
                        ),
                      );
                    }
                  },
                  child: const CustomText(
                    text: "Log out",
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 4.0, right: 4, top: 8, bottom: 8),
                  child: Divider(
                    color: Colors.white,
                    height: 1,
                  ),
                ),
                const CustomText(
                  text: "Delete account",
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  image: AssetImage("assets/images/buddee_up_logo.png"),
                  width: 87,
                  height: 87),
              SizedBox(
                height: 20,
              ),
              CustomText(
                text: "BUDDEEUP",
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                text: "EST. 2023",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
