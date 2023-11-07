import 'package:BuddeeUp/helpers/logger.dart';
import 'package:BuddeeUp/main.dart';
import 'package:BuddeeUp/providers/create_new_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import 'package:choice/choice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChoicePage extends StatefulWidget {
  const ChoicePage({Key? key}) : super(key: key);

  @override
  State<ChoicePage> createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<String> choices = [
    'Coffee Talks/Drinks/Happy Hours',
    'Spa',
    'Meals (Breakfast, brunch, Lunch, Dinner)',
    'Gin Tonic',
    'Festivals/Concerts',
    'Dance/EDM fest/Music',
    'Fetishes/Group',
    'Cafe Hopping',
    'Individual sports - Running/lift weights',
    'Gymnastics',
    'Team/Group sports - Volleyball/Kickball',
    'Hockey',
    'Arts/Museum/Culture',
    'Home Entertaining',
    'Buddeeup',
    'Meditation',
    'Self Care',
  ];
  List<String> selectedValue = [];
  void setSelectedValue(List<String> value) {
    setState(() => selectedValue = value);
  }

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
              Color.fromRGBO(227, 127, 236, 0.96),
              Color.fromRGBO(196, 32, 210, 0.96),
              Color.fromRGBO(
                  163, 11, 176, 0.96), // rgba(163.15, 11.02, 176.37, 0.96)
            ],
          ),
        ),
        child: Column(
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
                        text: "Activities",
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]),
            ),
            const Text(
              'Let everyone know what you’re interested in by adding it to your profile.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: InlineChoice<String>.multiple(
                  clearable: true,
                  value: selectedValue,
                  onChanged: setSelectedValue,
                  itemCount: choices.length,
                  itemBuilder: (selection, i) {
                    return ChoiceChip(
                      selected: selection.selected(choices[i]),
                      onSelected: selection.onSelected(choices[i]),
                      label: Text(
                        choices[i],
                        style:
                            const TextStyle(color: Colors.purple, fontSize: 14),
                      ),
                      color: const MaterialStatePropertyAll(
                        Colors.white,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    );
                  },
                  listBuilder: ChoiceList.createWrapped(
                    spacing: 8,
                    runSpacing: 8,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                  ),
                ),
              ),
            ),
            CustomButton(
              text: "UPDATE",
              textColor: Colors.black,
              onpress: () async {
                logger.i(selectedValue);
                  createNewUser.activities(selectedValue);

                if (createNewUser.newUser.activities.isEmpty) {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Select a vlaue'),
                    ),
                  );
                } else {
                  // Delete the actvites
                  // await firestore
                  //     .collection('users')
                  //     .doc(auth.currentUser!.uid)
                  //     .update({
                  //   'activities': FieldValue.delete(),
                  // }).then((value) {
                  //   print('Field deleted successfully');
                  // }).catchError((error) {
                  //   print('Failed to delete field: $error');
                  // });
                  // Update The activities
                  await firestore
                      .collection('users')
                      .doc(auth.currentUser!.uid)
                      .update({
                    'activities': selectedValue,
                  }).then((value) {
                    print('Field updated successfully');
                  }).catchError((error) {
                    print('Failed to update field: $error');
                  });

                  Navigator.pop(context);
                }
              },
              width: double.infinity,
              buttonColor: Colors.white,
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
