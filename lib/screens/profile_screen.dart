import 'package:BuddeeUp/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(227, 127, 236, 0.96), // rgba(227.15, 126.78, 235.88, 0.96)
              Color.fromRGBO(196, 32, 210, 0.96), // rgba(196.07, 31.56, 210.37, 0.96)
              Color.fromRGBO(163, 11, 176, 0.96), // rgba(163.15, 11.02, 176.37, 0.96)
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
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back_outlined),
                      color: Colors.white,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top:24.0, left: 8),
                      child: CustomText(text: "Profile", fontSize: 36, fontWeight: FontWeight.w600,),
                    ),
                  ]),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ListView(
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: ProfileContainer(heading: "Create a profile name", hint: 'John Smith',)),
                        Expanded(child: ProfileContainer(heading: "Age", hint: '1990-02-01',)),
                        ],
                    ),
                    const SizedBox(height: 10,),
                    const ProfileContainer(heading: "Bio", hint: 'Create a short bio', height: 160,),
                    const SizedBox(height: 20,),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CustomText(text: "Profile picture", fontSize: 12, fontWeight: FontWeight.w600,),
                        ),
                        CustomText(text: " *Add at least 2 photos to continue", fontSize: 12, fontWeight: FontWeight.w300,),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Container(),
                    const SizedBox(height: 10,),
                    const ProfileContainer(heading: "Height", hint: "5' ft 0\" in" ),
                    const ProfileContainer(heading: "Weight", hint: "130 lbs" ),
                    const SizedBox(height: 20),
                    CustomButton(text: "CONTINUE", onpress: (){ Navigator.pushNamed(context, "/sex_type_screen");},textColor: Colors.black,),
                    const SizedBox(height: 10)
                  ],
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
  const ProfileContainer({
    super.key, required this.heading, required this.hint,  this.height,
  });

  final String heading;
  final String hint;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left:8, right: 8),
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: heading, fontSize: 12, fontWeight: FontWeight.w600,),
          const SizedBox(height: 5,),
          Container(
            width: double.infinity,
            height: height,
            padding: const EdgeInsets.only(left: 6, top: 6, bottom: 6),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: TextFormField(
                controller: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(69, 81, 84, 64),
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                )),
          ),
          const SizedBox(height: 10,)
        ],
      ),
    );
  }
}
