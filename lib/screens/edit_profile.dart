import 'dart:io';

import 'package:BuddeeUp/models/activity.dart';
import 'package:BuddeeUp/widgets/custom_button.dart';
import 'package:BuddeeUp/widgets/custom_text.dart';
import 'package:BuddeeUp/helpers/get_user_details.dart';
import 'package:BuddeeUp/helpers/logger.dart';
import 'package:BuddeeUp/main.dart';
import 'package:BuddeeUp/models/new_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late String fileLocation;
  File? selectedImageFile;
  late String url;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            // height: size.height * 0.65,
            decoration: const BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: SafeArea(
              child: FutureBuilder(
                future: GetUserDetails().getUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Container();
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container();
                  }
                  NewUser user = NewUser.fromJson(snapshot.data!.data()!);

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Center(
                      child: Column(
                        children: [
                          const CustomText(
                            text: "BUDDEEUP",
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          Stack(
                            children: [
                              Positioned(
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white, // Border color
                                      width: 1.0, // Border width
                                    ),
                                  ),
                                  child: GestureDetector(
                                    onTap: () => Navigator.pushNamed(
                                      context,
                                      "/view_image",
                                      arguments: user.imageUrl,
                                    ),
                                    child: ClipOval(
                                      child: Image.network(
                                        user.imageUrl,
                                        width: 220,
                                        height: 220,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Container(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          GestureDetector(
                            onTap: () async {
                              showAdaptiveDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextButton(
                                        onPressed: () async {
                                          try {
                                            final picker = ImagePicker();
                                            final pickedFile =
                                                await picker.pickImage(
                                              source: ImageSource.gallery,
                                              imageQuality: 25,
                                            );
                                            Navigator.of(context).pop();
                                            if (pickedFile != null) {
                                              String fileName = DateTime.now()
                                                  .millisecondsSinceEpoch
                                                  .toString(); // Generate a unique filename
                                              fileLocation = fileName;
                                              Reference storageReference =
                                                  FirebaseStorage.instance
                                                      .ref()
                                                      .child('imageUrl')
                                                      .child(FirebaseAuth
                                                          .instance
                                                          .currentUser!
                                                          .uid)
                                                      .child(fileName);
                                              UploadTask uploadTask =
                                                  storageReference.putFile(
                                                File(pickedFile.path),
                                              );
                                              TaskSnapshot taskSnapshot =
                                                  await uploadTask
                                                      .whenComplete(() {});
                                              String downloadURL =
                                                  await taskSnapshot.ref
                                                      .getDownloadURL();
                                              url = downloadURL;
                                              if (auth.currentUser != null) {
                                                try {
                                                  DocumentReference
                                                      documentReference =
                                                      FirebaseFirestore.instance
                                                          .collection('users')
                                                          .doc(auth.currentUser!
                                                              .uid);

                                                  await documentReference
                                                      .update({
                                                    'imageUrl': url,
                                                  });
                                                  setState(() {
                                                    // user.imageUrl = url;
                                                  });
                                                  logger.i(
                                                      'Field updated successfully');
                                                } catch (e) {
                                                  logger.e(
                                                      'Error updating picture list: $e');
                                                }
                                              }
                                            }
                                          } catch (e) {
                                            ScaffoldMessenger.of(context)
                                                .removeCurrentSnackBar();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'An Error have occured'),
                                              ),
                                            );
                                          }
                                        },
                                        child: const Text(
                                          'CHOOSE FROM GALLERY',
                                          style: TextStyle(
                                            color: Colors.purple,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          try {
                                            final picker = ImagePicker();
                                            final pickedFile =
                                                await picker.pickImage(
                                              source: ImageSource.camera,
                                              imageQuality: 25,
                                            );
                                            Navigator.of(context).pop();

                                            if (pickedFile != null) {
                                              String fileName = DateTime.now()
                                                  .millisecondsSinceEpoch
                                                  .toString(); // Generate a unique filename
                                              fileLocation = fileName;
                                              Reference storageReference =
                                                  FirebaseStorage.instance
                                                      .ref()
                                                      .child('imageUrl')
                                                      .child(FirebaseAuth
                                                          .instance
                                                          .currentUser!
                                                          .uid)
                                                      .child(fileName);
                                              UploadTask uploadTask =
                                                  storageReference.putFile(
                                                File(pickedFile.path),
                                              );
                                              TaskSnapshot taskSnapshot =
                                                  await uploadTask
                                                      .whenComplete(() {});
                                              String downloadURL =
                                                  await taskSnapshot.ref
                                                      .getDownloadURL();
                                              url = downloadURL;
                                              if (auth.currentUser != null) {
                                                try {
                                                  DocumentReference
                                                      documentReference =
                                                      FirebaseFirestore.instance
                                                          .collection('users')
                                                          .doc(auth.currentUser!
                                                              .uid);
                                                  await documentReference
                                                      .update({
                                                    'imageUrl': url,
                                                  });

                                                  setState(() {
                                                    // user.imageUrl = url;
                                                  });
                                                  logger.i(
                                                      'Field updated successfully');
                                                } catch (e) {
                                                  logger.e(
                                                      'Error updating picture list: $e');
                                                }
                                              }
                                            }
                                          } catch (e) {}
                                          ScaffoldMessenger.of(context)
                                              .removeCurrentSnackBar();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content:
                                                  Text('An Error have occured'),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          'CHOOSE FROM CAMERA',
                                          style: TextStyle(
                                            color: Colors.purple,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15.0),
                              child: const Text(
                                'Change Profile Picture',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: "${user.profileName}, ${user.age}",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Icon(
                                Icons.verified,
                                color: Colors.black,
                                size: 24,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24.0, right: 24, bottom: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.settings,
                                          size: 40,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          //it w1orks
                                          Navigator.pushNamed(
                                              context, "/settings");
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const CustomText(
                                      text: "SETTINGS",
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.edit,
                                          size: 40,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, "/edit_info");
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const CustomText(
                                      text: "EDIT PROFILE",
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.verified,
                                          size: 40,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, "/go_pro_screen");
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const CustomText(
                                      text: "PRO",
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      border: Border.all(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle,
                          color: Colors.white,
                          size: 35,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CustomText(
                          text: "Make Your Buddeeup Proposition",
                          fontWeight: FontWeight.w400,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/proposition_screen");
                  },
                ),

                // events
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: "My Events",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                const SizedBox(height: 10),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('activity')
                      .doc(auth.currentUser!.uid)
                      .collection('events')
                      .orderBy('date')
                      .snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CustomText(
                        text: "Loading",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      );
                    }
                    if (snapshot.data!.docs.isEmpty) {
                      return const CustomText(
                        text: "No events for now",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      );
                    }
                    List<QueryDocumentSnapshot<Map<String, dynamic>>>? data =
                        snapshot.data?.docs;
                    logger.i(
                      data![0].data(),
                    );
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Activity activity = Activity.fromJson(
                          snapshot.data!.docs[index].data(),
                        );
                        return Column(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 12,
                                right: 8,
                                bottom: 10,
                              ),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 0.50, color: Colors.white),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.event,
                                    size: 30,
                                    color: const Color(
                                      0XFFC420D2,
                                    ).withOpacity(0.96),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(width: 12),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              activity.eventName,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'Source Sans Pro',
                                                fontWeight: FontWeight.w600,
                                                height: 0.06,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const SizedBox(
                                    width: 31,
                                    height: 31,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.green,
                                      child: Center(
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        );
                      },
                      itemCount: data!.length,
                    );
                  },
                ),

                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: CustomText(
                    text: "BUDDEEUP PRO",
                    color: Colors.purpleAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Center(
                  child: CustomText(
                    text: "Get free video calls duration",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                //replace with actual page indicator
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(left: 100, right: 100),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.purpleAccent,
                          size: 16,
                        ),
                        Icon(
                          Icons.circle,
                          color: Colors.white,
                          size: 16,
                        ),
                        Icon(
                          Icons.circle,
                          color: Colors.white,
                          size: 16,
                        ),
                        Icon(
                          Icons.circle,
                          color: Colors.white,
                          size: 16,
                        ),
                        Icon(
                          Icons.circle,
                          color: Colors.white,
                          size: 16,
                        ),
                        Icon(
                          Icons.circle,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: CustomButton(
                      text: "LEARN MORE",
                      onpress: () {
                        Navigator.pushNamed(context, "/go_pro_screen");
                      },
                      buttonColor: Colors.purpleAccent,
                      width: size.height * 0.3),
                ),
                const SizedBox(
                  height: 150,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
