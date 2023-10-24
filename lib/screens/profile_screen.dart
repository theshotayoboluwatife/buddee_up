import 'package:BuddeeUp/custom_widgets/custom_button.dart';
import 'package:BuddeeUp/helpers/logger.dart';
import 'package:BuddeeUp/providers/create_new_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom_widgets/custom_text.dart';
import '../custom_widgets/dotted_image_card.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final TextEditingController profileNameTextEditingController =
      TextEditingController();
  final TextEditingController ageTextEditingController =
      TextEditingController();
  final TextEditingController bioTextEditingController =
      TextEditingController();
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<String> images = [];

  @override
  Widget build(BuildContext context) {
    CreateNewUser createNewUser = Provider.of<CreateNewUser>(context);
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
                              type: TextInputType.text,
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
                        type: TextInputType.text,
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
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          HeightDropdown(),
                          const SizedBox(width: 50),
                          WeightDropdown(),
                        ],
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: "CONTINUE",
                        onpress: () {
                          if (images.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .removeCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Add a photo to continue'),
                              ),
                            );
                          }
                          if (formKey.currentState!.validate() &&
                              images.isNotEmpty) {
                            createNewUser.newUser.imageUrl = (images.isNotEmpty)
                                ? images[0]
                                : 'https://www.personality-insights.com/wp-content/uploads/2017/12/default-profile-pic-e1513291410505.jpg';
                            createNewUser.setProfile(
                              profileNameTextEditingController.text,
                              int.parse(ageTextEditingController.text),
                              bioTextEditingController.text,
                              images,
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
    required this.type,
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

class HeightDropdown extends StatefulWidget {
  Color? color;
  HeightDropdown({super.key, this.color});

  @override
  State<HeightDropdown> createState() => _HeightDropdownState();
}

class _HeightDropdownState extends State<HeightDropdown> {
  int selectedHeight = 3;

  List<String> generateHeightsList() {
    List<String> heights = [];
    for (int feet = 3; feet <= 8; feet++) {
      for (int inches = 0; inches <= 7; inches++) {
        heights.add("$feet feet $inches inches");
      }
    }
    return heights;
  }

  @override
  Widget build(BuildContext context) {
    CreateNewUser createNewUser =
        Provider.of<CreateNewUser>(context, listen: false);

    List<String> heightList = generateHeightsList();

    // createNewUser.newUser.height = heightList[0];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Height:',
          style: TextStyle(
            fontSize: 16,
            color: widget.color ?? Colors.white,
          ),
        ),
        const SizedBox(height: 2),
        DropdownButton<int>(
          value: selectedHeight,
          iconEnabledColor: Colors.white,
          dropdownColor: Colors.purple,
          items: heightList
              .asMap()
              .entries
              .map<DropdownMenuItem<int>>(
                (MapEntry<int, String> entry) => DropdownMenuItem<int>(
                  value: entry.key,
                  child: Text(
                    entry.value,
                    style: TextStyle(
                      color: widget.color ?? Colors.white,
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: (int? index) {
            setState(() {
              selectedHeight = index!;
            });
            createNewUser.newUser.height = heightList[index!];
            logger.i(createNewUser.newUser.height);
          },
        ),
      ],
    );
  }
}

class WeightDropdown extends StatefulWidget {
  Color? color;

  WeightDropdown({super.key, this.color});

  @override
  State<WeightDropdown> createState() => _WeightDropdownState();
}

class _WeightDropdownState extends State<WeightDropdown> {
  int selectedWeight = 50;

  List<String> generateWeightsList() {
    List<String> weights = [];
    for (int kilograms = 50; kilograms <= 150; kilograms++) {
      weights.add("$kilograms kg");
    }
    return weights;
  }

  @override
  Widget build(BuildContext context) {
    CreateNewUser createNewUser = Provider.of<CreateNewUser>(context);

    List<String> weightList = generateWeightsList();

    // createNewUser.newUser.weight = weightList[0];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Weight:',
          style: TextStyle(
            fontSize: 16,
            color: widget.color ?? Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        DropdownButton<int>(
          value: selectedWeight,
          iconEnabledColor: Colors.white,
          dropdownColor: Colors.purple,
          items: weightList
              .asMap()
              .entries
              .map<DropdownMenuItem<int>>(
                (MapEntry<int, String> entry) => DropdownMenuItem<int>(
                  value: entry.key,
                  child: Text(
                    entry.value,
                    style: TextStyle(
                      color: widget.color ?? Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: (int? index) {
            setState(() {
              selectedWeight = index!;
            });
            createNewUser.newUser.weight = weightList[index!];
            logger.i(createNewUser.newUser.weight);
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
