import 'package:BuddeeUp/custom_widgets/dotted_image_card.dart';
import 'package:BuddeeUp/helpers/get_user_details.dart';
import 'package:BuddeeUp/helpers/logger.dart';
import 'package:BuddeeUp/main.dart';
import 'package:BuddeeUp/models/new_user.dart';
import 'package:BuddeeUp/providers/create_new_user.dart';
import 'package:BuddeeUp/screens/edit_screen/choice_page.dart';
import 'package:BuddeeUp/screens/edit_screen/relationship.dart';
import 'package:BuddeeUp/screens/edit_screen/sex.dart';
import 'package:BuddeeUp/screens/edit_screen/sex_prefrence.dart';
import 'package:BuddeeUp/screens/edit_screen/tribe.dart';
import 'package:BuddeeUp/screens/proposition_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom_widgets/custom_text.dart';

class EditInfo extends StatefulWidget {
  const EditInfo({Key? key}) : super(key: key);

  @override
  State<EditInfo> createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {
  List<String> images = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    aboutMe.dispose();
    update();
    super.dispose();
  }

  update() async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      DocumentReference userDoc = users.doc(auth.currentUser!.uid);
      // Update the field
      await userDoc.update({
        'bio': aboutMe.text.trim(), // Replace 'fieldName' with your field name
      });
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error Updating Phone Number')));
      // Navigator.of(context).pop();
    }
  }

  final TextEditingController aboutMe = TextEditingController();

  String smokeStatus = 'No';
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final createNewUser = Provider.of<CreateNewUser>(context, listen: true);
    return Scaffold(
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Error Updating Phone Number'),
                ),
              );
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
      ),
      body: SingleChildScrollView(
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
            aboutMe.text = user.bio;
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
                                      width: 60,
                                      height: 75,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
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
                          fontWeight: FontWeight.w400,
                        ),
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
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const ChoicePage(),
                      ),
                    ),
                    title: user.activities.join(', '),
                    icon: Icons.navigate_next,
                  ),
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
                  SimpleRowContainer(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const PropositionScreen(),
                      ),
                    ),
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
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const Relationship(),
                      ),
                    ),
                    title: 'Relationship Status',
                    option: user.status,
                    icon: Icons.people_alt,
                  ),
                  RowContainer(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const TribeSetting(),
                      ),
                    ),
                    title: 'Tribe',
                    option: user.tribe,
                    icon: Icons.family_restroom,
                  ),
                  RowContainer(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const SexPreferences(),
                      ),
                    ),
                    title: 'Sexual Preferences',
                    option: user.sexualPreferences,
                    icon: Icons.transgender,
                  ),
                  RowContainer(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Do You Smoke?'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  title: const Text('Yes'),
                                  onTap: () async {
                                    createNewUser.newUser.smoking = "Yes";
                                    await firestore
                                        .collection('users')
                                        .doc(auth.currentUser!.uid)
                                        .update({
                                      'smoking': createNewUser.newUser.smoking,
                                    }).then((value) {
                                      print('Field updated successfully');
                                    }).catchError((error) {
                                      print('Failed to update field: $error');
                                    });
                                    setState(() {
                                      smokeStatus = 'Yes';
                                      Navigator.of(context).pop();
                                    });
                                  },
                                ),
                                ListTile(
                                  title: const Text('No'),
                                  onTap: () async {
                                    createNewUser.newUser.smoking = "No";
                                    await firestore
                                        .collection('users')
                                        .doc(auth.currentUser!.uid)
                                        .update({
                                      'smoking': createNewUser.newUser.smoking,
                                    }).then((value) {
                                      print('Field updated successfully');
                                    }).catchError((error) {
                                      print('Failed to update field: $error');
                                    });
                                    setState(() {
                                      smokeStatus = 'No';
                                      Navigator.of(context).pop();
                                    });
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    title: 'Smoking',
                    option: user.smoking,
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
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => Sex(),
                      ),
                    ),
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
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const ProfileSlider(),
                ],
              ),
            );
          },
        ),
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

class ProfileSlider extends StatefulWidget {
  const ProfileSlider({super.key});

  @override
  State<ProfileSlider> createState() => _ProfileSliderState();
}

class _ProfileSliderState extends State<ProfileSlider> {
  bool switchValue = true;
  bool switchValue2 = true;
  bool switchValue3 = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
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
              const CustomText(
                text: 'Don\'t show my age"',
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
          padding: const EdgeInsets.only(left: 16, right: 16),
          decoration: const BoxDecoration(
              color: Color(0xFF141416),
              border: Border(
                  top: BorderSide(width: 1, color: Colors.white),
                  bottom: BorderSide(width: 1, color: Colors.white))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: 'Dont\'t show my distance',
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
        Container(
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
              const CustomText(
                text: 'Dont\'t show my religion',
                fontWeight: FontWeight.w500,
                fontSize: 15,
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
        ),
      ],
    );
  }
}

class SimpleRowContainer extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  const SimpleRowContainer({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
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
          IconButton(
            onPressed: onTap,
            icon: Icon(
              icon,
              color: const Color(0x99A3B0E0),
            ),
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
  final void Function()? onPressed;

  const RowContainer({
    super.key,
    required this.title,
    required this.option,
    required this.icon,
    this.onPressed,
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
              IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.navigate_next),
                color: const Color(0x99A3B0E0),
              )
            ],
          )
        ],
      ),
    );
  }
}
