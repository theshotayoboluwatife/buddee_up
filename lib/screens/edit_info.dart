import 'package:BuddeeUp/custom_widgets/dotted_image_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom_widgets/custom_text.dart';
import '../providers/status_provider.dart';

class EditInfo extends StatefulWidget {
  const EditInfo({Key? key}) : super(key: key);

  @override
  State<EditInfo> createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool switchValue = true;
  bool switchValue2 = true;
  bool switchValue3 = true;
  List<String> images = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 2,
        vsync: this); // Change the length as per your number of tabs.
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final profilePictureData = Provider.of<Status>(context).profilePicturesData;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.clear),
            color: Colors.white,
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const CustomText(
            text: "Edit Info",
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 18,
          ),
          actions: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Padding(
                padding: EdgeInsets.only(right: 24.0),
                child: CustomText(
                  text: "Done",
                  fontWeight: FontWeight.w500,
                  color: Colors.purpleAccent,
                  fontSize: 18,
                ),
              ),
            ),
          ],
          bottom: const TabBar(
            labelColor: Colors.purpleAccent,
            indicator: null,
            indicatorColor: Colors.transparent,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "Edit"),
              Tab(text: "Preview"),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            //first tab{Edit} content
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0, right: 20, top: 24,bottom: 8),
                      child: Column(

                        children: [
                          Row(
                            children: [
                            DottedImageCard(images: images),
                                DottedImageCard(images: images),
                                DottedImageCard(images: images),
                                DottedImageCard(images: images),
                            ],
                          ),
                          Row(
                            children: [
                             DottedImageCard(images: images),
                                DottedImageCard(images: images),
                                DottedImageCard(images: images),
                                DottedImageCard(images: images),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomText(
                      text:
                          "Add a pic to get 4% closer to completing your profile and you may even get more Likes",
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const BulletHeading(title: "ABOUT ME"),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                        padding: const EdgeInsets.all(4),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Color(0xFF141416),
                            border: Border(
                                top: BorderSide(width: 1, color: Colors.white),
                                left: BorderSide(width: 1, color: Colors.white),
                                right: BorderSide(width: 1, color: Colors.white),
                                bottom:
                                    BorderSide(width: 1, color: Colors.white))),
                        child: const TextField(
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: ' ',
                            hintStyle: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.w400),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    const BulletHeading(title: "INTERESTS"),
                    const SizedBox(
                      height: 5,
                    ),
                    const SimpleRowContainer(
                        title:
                            "Coffee Talks/Drinks/Happy Hours, Festival/Concerts, Fetishes/Groups, Buddeeup",
                        icon: Icons.navigate_next),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: CustomText(
                        text:
                            "Share your interests and keep your personal info private",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const BulletHeading(
                      title: "BUDDEEUP Proposition",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SimpleRowContainer(
                      title: 'Propose BuddeeUp Proposition',
                      icon: Icons.navigate_next,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const BulletHeading(
                      title: "LIFESTYLE",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const RowContainer(
                      title: 'Relationship Status',
                      option: 'Married',
                      icon: Icons.people_alt,
                    ),
                    const RowContainer(
                      title: 'Tribe',
                      option: 'Clean Cut',
                      icon: Icons.family_restroom,
                    ),
                    const RowContainer(
                      title: 'Sexual Preferences',
                      option: 'Bottom',
                      icon: Icons.transgender,
                    ),
                    const RowContainer(
                      title: 'Smoking',
                      option: 'No',
                      icon: Icons.smoking_rooms,
                    ),
                    const SizedBox(height: 30),
                    const BulletHeading(
                      title: "SEX",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SimpleRowContainer(
                      title: 'Male',
                      icon: Icons.navigate_next,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const BulletHeading(
                      title: "BODY TYPE",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SimpleRowContainer(
                        title: "Avg", icon: Icons.navigate_next),
                    const SizedBox(
                      height: 20,
                    ),
                    const BulletHeading(
                      title: "Ethnicity",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SimpleRowContainer(
                      title: 'African-American',
                      icon: Icons.navigate_next,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const BulletHeading(title: 'Height'),
                    const SizedBox(
                      height: 5,
                    ),
                    const SimpleRowContainer(
                        title: "5'ft 0\"in", icon: Icons.keyboard_arrow_up),
                    const SizedBox(
                      height: 20,
                    ),
                    const BulletHeading(title: 'Weight'),
                    const SimpleRowContainer(
                        title: "130 lbs", icon: Icons.keyboard_arrow_up),
                    const SizedBox(
                      height: 20,
                    ),
                    const BulletHeading(
                      title: "GENDER",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SimpleRowContainer(
                        title: "Man", icon: Icons.navigate_next),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 24.0),
                          child: CustomText(
                            text: "MANAGE YOUR PROFILE",
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
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
                    const SizedBox(
                      height: 5,
                    ),
                    generateSwitchContainer("Dont't show my age", switchValue),
                    generateSwitchContainer(
                        "Dont't show my distance", switchValue2),
                    generateSwitchContainer(
                        "Dont't show my religion", switchValue3),
                  ],
                ),
              ),
            ),

            //Second tab{Preview} content
            Container()
          ],
        ),
      ),
    );
  }

  Container generateSwitchContainer(String title, bool switchValue) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 16, right: 16),
      decoration: const BoxDecoration(
          color: Color(0xFF141416),
          border: Border(
              top: BorderSide(width: 1, color: Colors.white),
              bottom: BorderSide(width: 1, color: Colors.white))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
          Switch(
            value: this.switchValue,
            onChanged: (newValue) {
              setState(() {
                this.switchValue = newValue;
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

class BulletHeading extends StatelessWidget {
  final String title;
  const BulletHeading({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Icon(
            Icons.circle,
            color: Colors.purpleAccent,
            size: 10,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        CustomText(
          text: title,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }
}

class SimpleRowContainer extends StatelessWidget {
  final String title;
  final IconData icon;
  const SimpleRowContainer({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 24),
      decoration: const BoxDecoration(
          color: Color(0xFF141416),
          border: Border(
              top: BorderSide(width: 1, color: Colors.white),
              bottom: BorderSide(width: 1, color: Colors.white))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: CustomText(
                text: title,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
          ),
          Icon(
            icon,
            color: const Color(0x99A3B0E0),
          )
        ],
      ),
    );
  }
}

class RowContainer extends StatelessWidget {
  final String title;
  final String option;
  final IconData icon;
  const RowContainer({
    super.key,
    required this.title,
    required this.option,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Color(0xFF141416),
          border: Border(
              top: BorderSide(width: 1, color: Colors.white),
              bottom: BorderSide(width: 1, color: Colors.white))),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          CustomText(
            text: title,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
          const Spacer(),
          Row(
            children: [
              CustomText(
                text: option,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              const Icon(
                Icons.navigate_next,
                color: Color(0x99A3B0E0),
              )
            ],
          )
        ],
      ),
    );
  }
}
