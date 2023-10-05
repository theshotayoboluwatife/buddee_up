import 'package:BuddeeUp/custom_widgets/dotted_image_card.dart';
import 'package:BuddeeUp/helpers/get_user_details.dart';
import 'package:BuddeeUp/main.dart';
import 'package:BuddeeUp/models/new_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/custom_text.dart';

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
    aboutMe.dispose();
    super.dispose();
  }

  final TextEditingController aboutMe = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
            onPressed: () async {
              try {
                CollectionReference users =
                    FirebaseFirestore.instance.collection('users');
                DocumentReference userDoc = users.doc(auth.currentUser!.uid);
                // Update the field
                await userDoc.update({
                  'bio': aboutMe.text
                      .trim(), // Replace 'fieldName' with your field name
                });
                Navigator.of(context).pop();
              } catch (e) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Error Updating Phone Number')));
                // Navigator.of(context).pop();
              }
            },
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
              child: FutureBuilder(
                future: GetUserDetails().getUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container();
                  }
                  if (snapshot.hasError) {
                    return Container();
                  }
                  NewUser user = NewUser.fromJson(snapshot.data!.data()!);

                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 24.0, right: 20, top: 24, bottom: 8),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ...List.generate(4, (index) {
                                    if (user.pictures.length > index) {
                                      return Container(
                                        padding: const EdgeInsets.all(4),
                                        child: DottedBorder(
                                          color: Colors.white,
                                          strokeWidth: 1,
                                          dashPattern: const [4, 6],
                                          borderType: BorderType.RRect,
                                          radius: const Radius.circular(10),
                                          child: Container(
                                            width: size.width * 0.125,
                                            height: 75,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                user.pictures[index],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    return DottedImageCard(images: images);
                                  }),
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
                              bottom: BorderSide(width: 1, color: Colors.white),
                            ),
                          ),
                          child: TextField(
                            controller: aboutMe,
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const BulletHeading(title: "INTERESTS"),
                        const SizedBox(
                          height: 5,
                        ),
                         SimpleRowContainer(
                            title:
                                user.activities.join(', '),
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
                        RowContainer(
                          title: 'Relationship Status',
                          option: user.status,
                          icon: Icons.people_alt,
                        ),
                         RowContainer(
                          title: 'Tribe',
                          option: user.tribe,
                          icon: Icons.family_restroom,
                        ),
                        RowContainer(
                          title: 'Sexual Preferences',
                          option: user.sexualPreferences,
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
                         SimpleRowContainer(
                          title: user.gender,
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
                        BulletHeading(
                          title: user.ethnicity,
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
                         SimpleRowContainer(
                            title: user.height, icon: Icons.keyboard_arrow_up),
                        const SizedBox(
                          height: 20,
                        ),
                        const BulletHeading(title: 'Weight'),
                         SimpleRowContainer(
                            title: user.weight, icon: Icons.keyboard_arrow_up),
                        const SizedBox(
                          height: 20,
                        ),
                        const BulletHeading(
                          title: "GENDER",
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                         SimpleRowContainer(
                            title: user.gender, icon: Icons.navigate_next),
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
                        generateSwitchContainer(
                            "Dont't show my age", switchValue),
                        generateSwitchContainer(
                            "Dont't show my distance", switchValue2),
                        generateSwitchContainer(
                            "Dont't show my religion", switchValue3),
                      ],
                    ),
                  );
                },
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
