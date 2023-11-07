import 'package:BuddeeUp/widgets/custom_button.dart';
import 'package:BuddeeUp/widgets/custom_text.dart';
import 'package:BuddeeUp/main.dart';
import 'package:BuddeeUp/providers/create_new_user.dart';
import 'package:BuddeeUp/screens/edit_screen/tribe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Eth extends StatefulWidget {
  const Eth({Key? key}) : super(key: key);

  @override
  State<Eth> createState() => _EthnicityState();
}

class _EthnicityState extends State<Eth> {
  String selectedEthnicity = "African-American"; // Initial selected value
  List<String> ethnicityItems = [
    "African-American",
    "Asian",
    "Indian",
    "Middle-Eastern",
    "Latino",
    "Native-American",
    "White",
  ];
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
                        text: "Ethnicity",
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]),
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: "Select Ethnic group",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: DropdownButton(
                        value: selectedEthnicity,
                        items: ethnicityItems.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedEthnicity = value!;
                          });
                          createNewUser.ethnicity(value!);
                        },
                        icon: const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(
                              Icons.keyboard_arrow_down_outlined,
                            )),
                        iconEnabledColor: Colors.black,
                        style: const TextStyle(
                            //te
                            color: Colors.black,
                            fontSize: 20),
                        dropdownColor: Colors.white,
                        underline: Container(),
                        isExpanded: true,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
              text: "CONTINUE",
              textColor: Colors.black,
              onpress: () async {
                if (createNewUser.newUser.ethnicity.isEmpty) {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Select a vlaue'),
                    ),
                  );
                } else {
                  await firestore
                      .collection('users')
                      .doc(auth.currentUser!.uid)
                      .update({
                    'ethnicity': createNewUser.newUser.ethnicity,
                  }).then((value) {
                    print('Field updated successfully');
                  }).catchError((error) {
                    print('Failed to update field: $error');
                  });
                  createNewUser.update();
                  Navigator.of(context).pop();
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
