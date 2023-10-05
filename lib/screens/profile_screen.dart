import 'package:BuddeeUp/custom_widgets/custom_button.dart';
import 'package:BuddeeUp/helpers/logger.dart';
import 'package:BuddeeUp/providers/create_new_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom_widgets/custom_text.dart';
import '../custom_widgets/dotted_image_card.dart';
import '../providers/status_provider.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final TextEditingController profileNameTextEditingController =
      TextEditingController();
  final TextEditingController ageTextEditingController =
      TextEditingController();
  final TextEditingController bioTextEditingController =
      TextEditingController();
  final TextEditingController heightTextEditingController =
      TextEditingController();
  final TextEditingController weightTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<String> images = [];

  @override
  Widget build(BuildContext context) {
    CreateNewUser createNewUser = Provider.of<CreateNewUser>(context);
    final profilePictureData = Provider.of<Status>(context).profilePicturesData;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(
                  227, 127, 236, 0.96), // rgba(227.15, 126.78, 235.88, 0.96)
              Color.fromRGBO(
                  196, 32, 210, 0.96), // rgba(196.07, 31.56, 210.37, 0.96)
              Color.fromRGBO(
                  163, 11, 176, 0.96), // rgba(163.15, 11.02, 176.37, 0.96)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_outlined),
                      color: Colors.white,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 24.0, left: 8),
                      child: CustomText(
                        text: "Profile",
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ProfileContainer(
                              validator: (value) {
                                if (value!.length < 3) {
                                  return 'Profile name must be greater than 3';
                                }
                                return null;
                              },
                              heading: "Create a profile name",
                              hint: 'John Smith',
                              controller: profileNameTextEditingController,
                            ),
                          ),
                          Expanded(
                            child: ProfileContainer(
                              type: TextInputType.number,
                              validator: (p) {
                                if (int.parse(p!).isNaN) {
                                  return "Imput a valid age";
                                }
                                return null;
                              },
                              heading: "Age",
                              hint: '18',
                              controller: ageTextEditingController,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ProfileContainer(
                        validator: (p) {
                          if (p!.isEmpty) {
                            return 'Bio Can\'t be empty';
                          }
                          return null;
                        },
                        heading: "Bio",
                        hint: 'Create a short bio',
                        height: 160,
                        controller: bioTextEditingController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CustomText(
                              text: "Profile picture",
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          CustomText(
                            text: " *Add at least 2 photos to continue",
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
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
                        height: 1,
                      ),
                      ProfileContainer(
                        validator: (p) {
                          if (p!.isEmpty) {
                            heightTextEditingController.text = "5' ft 0\" in";
                          }
                          return null;
                        },
                        heading: "Height",
                        hint: "5' ft 0\" in",
                        controller: heightTextEditingController,
                      ),
                      ProfileContainer(
                        validator: (p) {
                          if (p!.isEmpty) {
                            weightTextEditingController.text = "130 lbs";
                          }
                          return null;
                        },
                        heading: "Weight",
                        hint: "130 lbs",
                        controller: weightTextEditingController,
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: "CONTINUE",
                        onpress: () {
                          if (images.length < 2) {
                            ScaffoldMessenger.of(context)
                                .removeCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Add at least 2 photos to continue'),
                              ),
                            );
                          }
                          if (formKey.currentState!.validate()) {
                            createNewUser.setProfile(
                              profileNameTextEditingController.text,
                              int.parse(ageTextEditingController.text),
                              bioTextEditingController.text,
                              images,
                              heightTextEditingController.text,
                              weightTextEditingController.text,
                            );
                            Navigator.pushNamed(context, "/sex_type_screen");
                            logger.i(createNewUser.newUser.imageUrl);
                          }
                        },
                        textColor: Colors.black,
                      ),
                      const SizedBox(height: 10)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileContainer extends StatelessWidget {
  final TextEditingController controller;

  final String? Function(String?)? validator;

  final TextInputType type;

  const ProfileContainer({
    super.key,
    this.type = TextInputType.text,
    required this.heading,
    required this.hint,
    this.height,
    required this.controller,
    required this.validator,
  });

  final String heading;
  final String hint;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: heading,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            height: height,
            padding: const EdgeInsets.only(left: 6, top: 6, bottom: 6),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: TextFormField(
              keyboardType: type,
              validator: validator,
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: const TextStyle(
                  color: Color.fromARGB(69, 81, 84, 64),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
