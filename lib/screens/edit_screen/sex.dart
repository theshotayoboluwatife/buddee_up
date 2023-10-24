import 'package:BuddeeUp/custom_widgets/custom_button.dart';
import 'package:BuddeeUp/custom_widgets/custom_text.dart';
import 'package:BuddeeUp/main.dart';
import 'package:BuddeeUp/providers/create_new_user.dart';
import 'package:BuddeeUp/screens/edit_screen/tribe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sex extends StatelessWidget {
  bool value = false;

  Sex({Key? key}) : super(key: key);

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
              onpress: () async {
                createNewUser.sex('Male');
                await firestore
                    .collection('users')
                    .doc(auth.currentUser!.uid)
                    .update({
                  'gender': createNewUser.newUser.gender,
                }).then((value) {
                  print('Field updated successfully');
                }).catchError((error) {
                  print('Failed to update field: $error');
                });
                createNewUser.update();

                Navigator.of(context).pop();
              },
              textColor: Colors.black,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Trans Female",
              onpress: () async {
                createNewUser.sex('Trans Female');
                await firestore
                    .collection('users')
                    .doc(auth.currentUser!.uid)
                    .update({
                  'gender': createNewUser.newUser.gender,
                }).then((value) {
                  print('Field updated successfully');
                }).catchError((error) {
                  print('Failed to update field: $error');
                });
                createNewUser.update();
                Navigator.of(context).pop();
              },
              textColor: Colors.black,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Trans Male",
              onpress: () async {
                createNewUser.sex('Trans Male');
                await firestore
                    .collection('users')
                    .doc(auth.currentUser!.uid)
                    .update({
                  'gender': createNewUser.newUser.gender,
                }).then((value) {
                  print('Field updated successfully');
                }).catchError((error) {
                  print('Failed to update field: $error');
                });
                createNewUser.update();
                Navigator.of(context).pop();
              },
              textColor: Colors.black,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
