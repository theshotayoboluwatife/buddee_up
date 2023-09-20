import 'package:BuddeeUp/custom_widgets/dotted_image_card.dart';
import 'package:BuddeeUp/screens/ethnicity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    final profilePictureData = Provider.of<Status>(context).profilePicturesData;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.clear),
            color: Colors.white,
            onPressed: () {},
          ),
          title: CustomText(
            text: "Edit Info",
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 18,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: CustomText(
                text: "Done",
                fontWeight: FontWeight.w500,
                color: Colors.purpleAccent,
                fontSize: 18,
              ),
            ),
          ],
          bottom: TabBar(
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
            Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 8),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              DottedImageCard(
                                image: profilePictureData[0],
                                isAddedMedia: false,
                              ),
                              DottedImageCard(
                                image: profilePictureData[1],
                                isAddedMedia: false,
                              ),
                              DottedImageCard(
                                image: profilePictureData[2],
                                isAddedMedia: false,
                              ),
                              DottedImageCard(
                                image: profilePictureData[3],
                                isAddedMedia: false,
                              ),
                              DottedImageCard(
                                image: profilePictureData[4],
                                isAddedMedia: false,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              DottedImageCard(
                                image: profilePictureData[0],
                                isAddedMedia: true,
                              ),
                              DottedImageCard(
                                image: profilePictureData[1],
                                isAddedMedia: true,
                              ),
                              DottedImageCard(
                                image: profilePictureData[2],
                                isAddedMedia: true,
                              ),
                              DottedImageCard(
                                image: profilePictureData[3],
                                isAddedMedia: true,
                              ),
                              DottedImageCard(
                                image: profilePictureData[4],
                                isAddedMedia: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text:
                          "Add a pic to get 4% closer to completing your profile and you may even get more Likes",
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    SizedBox(
                      height: 20,
                    ), 
                    BulletHeading(title: "ABOUT ME"),
                    SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(4),
                        width: double.infinity,
                        child: TextField(
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: ' ',
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xFF141416),
                            border: Border(
                                top: BorderSide(width: 1, color: Colors.white),
                                left: BorderSide(width: 1, color: Colors.white),
                                right:
                                    BorderSide(width: 1, color: Colors.white),
                                bottom:
                                    BorderSide(width: 1, color: Colors.white))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BulletHeading(title: "INTERESTS"),
                    SizedBox(
                      height: 5,
                    ),
                    SimpleRowContainer(title:  "Coffee Talks/Drinks/Happy Hours, Festival/Concerts, Fetishes/Groups, Buddeeup", icon: Icons.navigate_next),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomText(
                        text:
                            "Share your interests and keep your personal info private",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    BulletHeading(title: "BUDDEEUP Proposition",),
                    SizedBox(height: 5,),
                    SimpleRowContainer(title: 'Propose BuddeeUp Proposition', icon:  Icons.navigate_next,),
                    SizedBox(height: 30,),
                    BulletHeading(title: "LIFESTYLE",),
                    SizedBox(height: 5,),
                    RowContainer(title: 'Relationship Status', option: 'Married', icon: Icons.people_alt,),
                    RowContainer(title: 'Tribe', option: 'Clean Cut', icon: Icons.family_restroom,),
                    RowContainer(title: 'Sexual Preferences', option: 'Bottom', icon: Icons.transgender,),
                    RowContainer(title: 'Smoking', option: 'No', icon: Icons.smoking_rooms,),
                    SizedBox(height:30),
                    BulletHeading(title: "SEX",),
                    SizedBox(height: 5,),
                    SimpleRowContainer(title: 'Male', icon:  Icons.navigate_next,),
                    SizedBox(height: 20,),
                    BulletHeading(title: "BODY TYPE",),
                    SizedBox(height: 5,),
                    SimpleRowContainer(title: "Avg", icon: Icons.navigate_next),
                    SizedBox(height: 20,),
                    BulletHeading(title: "Ethnicity",),
                    SizedBox(height: 5,),
                    SimpleRowContainer(title: 'African-American', icon:  Icons.navigate_next,),
                    SizedBox(height: 20,),
                    BulletHeading(title: 'Height'),
                    SizedBox(height: 5,),
                    SimpleRowContainer(title: "5\'ft 0\"in", icon: Icons.keyboard_arrow_up),
                    SizedBox(height: 20,),
                    BulletHeading(title: 'Weight'),
                    SimpleRowContainer(title: "130 lbs", icon: Icons.keyboard_arrow_up),
                    SizedBox(height: 20,),
                    BulletHeading(title: "GENDER",),
                    SizedBox(height: 5,),
                    SimpleRowContainer(title: "Man", icon: Icons.navigate_next),
                    SizedBox(height: 20,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: CustomText(text: "MANAGE YOUR PROFILE", fontWeight: FontWeight.w500,fontSize: 15,),
                        ),
                        SizedBox(width: 5,),
                        Icon(
                          Icons.verified,
                          color: Colors.purpleAccent,
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                    generateSwitchContainer("Dont\'t show my age", switchValue),
                    generateSwitchContainer("Dont\'t show my distance", switchValue2),
                    generateSwitchContainer("Dont\'t show my religion", switchValue3),
                  ],
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
                      padding: EdgeInsets.only(left:16, right: 16),
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
                      decoration: BoxDecoration(
                          color: Color(0xFF141416),
                          border: Border(
                              top: BorderSide(width: 1, color: Colors.white),
                              bottom:
                                  BorderSide(width: 1, color: Colors.white))),
                    );

  }
}

class BulletHeading extends StatelessWidget {
  final String title;
  const BulletHeading({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Icon(
            Icons.circle,
            color: Colors.purpleAccent,
            size: 10,
          ),
        ),
        SizedBox(
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
    super.key, required this.title, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(top:10,bottom: 10,right: 10, left: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomText(
                text: title,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            Icon(icon, color: Color(0x99A3B0E0),)
          ],
        ),
        decoration: BoxDecoration(
            color: Color(0xFF141416),
            border: Border(
                top: BorderSide(width: 1, color: Colors.white),
                bottom: BorderSide(width: 1, color: Colors.white))),
      );
  }
}

class RowContainer extends StatelessWidget {
  final String title;
  final String option;
  final IconData icon;
   RowContainer({
    super.key, required this.title, required this.option, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(icon, color: Colors.white,),
            ),
            CustomText(
              text: title,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
            Spacer(),
            Row(
                  children: [
                    CustomText(text: option, fontSize: 12, fontWeight: FontWeight.w400,),
                    Icon(
                      Icons.navigate_next,
                      color: Color(0x99A3B0E0),
                    )
                  ],
                )

          ],
        ),
        decoration: BoxDecoration(
            color: Color(0xFF141416),
            border: Border(
                top: BorderSide(width: 1, color: Colors.white),
                bottom:
                    BorderSide(width: 1, color: Colors.white))),
      );
  }
}
