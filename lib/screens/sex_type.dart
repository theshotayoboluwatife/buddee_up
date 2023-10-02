import 'package:BuddeeUp/custom_widgets/custom_button.dart';
import 'package:BuddeeUp/providers/create_new_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom_widgets/custom_text.dart';

class SexType extends StatelessWidget {
  bool value = false;

  SexType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createNewUser = Provider.of<CreateNewUser>(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
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
                        text: "Sex",
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]),
            ),
            const Spacer(),
            CustomButton(
              text: "Male",
              onpress: () {
                createNewUser.sex('Male');
                Navigator.pushNamed(context, "/tribe_screen");
              },
              textColor: Colors.black,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Trans Female",
              onpress: () {
                createNewUser.sex('Trans Female');
                Navigator.pushNamed(context, "/tribe_screen");
              },
              textColor: Colors.black,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Trans Male",
              onpress: () {
                createNewUser.sex('Trans Male');
                Navigator.pushNamed(context, "/tribe_screen");
              },
              textColor: Colors.black,
            ),
            const Spacer(),
            Row(
              children: [
                Checkbox(
                    value: value,
                    onChanged: (b) {
                      value = !value;
                    }),
                const CustomText(
                  text: "Show my gender on my profile",
                  fontWeight: FontWeight.w400,
                )
              ],
            ),
            CustomButton(
              text: "CONTINUE",
              onpress: () => Navigator.pushNamed(context, '/tribe_screen'),
              textColor: Colors.black,
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
