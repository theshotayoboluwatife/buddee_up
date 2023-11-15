import 'package:BuddeeUp/helpers/logger.dart';
import 'package:BuddeeUp/main.dart';
import 'package:BuddeeUp/models/activity.dart';
import 'package:BuddeeUp/screens/edit_profile.dart';
import 'package:BuddeeUp/widgets/custom_button.dart';
import 'package:BuddeeUp/screens/cafe_talks.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../widgets/custom_text.dart';

class PropositionScreen extends StatefulWidget {
  const PropositionScreen({Key? key}) : super(key: key);

  @override
  State<PropositionScreen> createState() => _PropositionScreenState();
}

class _PropositionScreenState extends State<PropositionScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController eventName = TextEditingController();
  final TextEditingController activityType = TextEditingController();
  final TextEditingController approxArea = TextEditingController();
  final TextEditingController approxZipCode = TextEditingController();
  final TextEditingController where = TextEditingController();

  DateTime date = DateTime.now();
  TimeOfDay startTime = const TimeOfDay(hour: 12, minute: 03);
  TimeOfDay stopTime = const TimeOfDay(hour: 12, minute: 03);

  bool isLoggedInSelected = false;

  @override
  void dispose() {
    eventName.dispose();
    activityType.dispose();
    approxArea.dispose();
    approxZipCode.dispose();
    where.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final startHour = startTime.hour.toString().padLeft(2, '0');
    final stopHour = stopTime.hour.toString().padLeft(2, '0');
    final startMinute = startTime.minute.toString().padLeft(2, '0');
    final stopMinute = stopTime.minute.toString().padLeft(2, '0');
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 4),
        width: double.infinity,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.navigate_before,
                        color: Colors.purpleAccent,
                      )),
                  const CustomText(
                    text: "Back",
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.purpleAccent,
                  )
                ],
              ),
              const CustomText(
                text: "Make Your BuddeeUp\nProposition",
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      //activity type
                      Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                text: "Activity Type",
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  child: TextFormField(
                                    controller: activityType,
                                    decoration: const InputDecoration(
                                      hintText: "Fetishes/Groups",
                                      hintStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 9,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    cursorColor: Colors.purpleAccent,
                                    style: const TextStyle(color: Colors.white),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Field can not be empty.';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 30),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomText(
                                    text: "Event Name",
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Container(
                                      width: size.width * 0.45,
                                      height: 48,
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: TextFormField(
                                          controller: eventName,
                                          cursorColor: Colors.purpleAccent,
                                          decoration: const InputDecoration(
                                            hintText:
                                                "Create a name for your event",
                                            hintStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 9,
                                                fontWeight: FontWeight.w300),
                                            border: InputBorder.none,
                                          ),
                                          style: const TextStyle(
                                              color: Colors.white),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Can not be empty.';
                                            }
                                            return null;
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomText(
                                    text: "Date",
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  DecoratedBox(
                                    position: DecorationPosition.background,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Container(
                                      width: size.width * 0.45,
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: TextButton(
                                        child: CustomText(
                                            text:
                                                "${date.month}-${date.day}-${date.year} ",
                                            fontSize: 9,
                                            fontWeight: FontWeight.w300),
                                        onPressed: () async {
                                          DateTime? newDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: date,
                                                  firstDate: DateTime(1900),
                                                  lastDate: DateTime(2025));
                                          if (newDate == null) return;
                                          setState(() {
                                            date = newDate;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      //suggested time
                      Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                text: "Suggested Times (optional)",
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 1),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Container(
                                        width: size.width * 0.45,
                                        height: 48,
                                        padding: const EdgeInsets.only(
                                          left: 8,
                                          right: 8,
                                        ),
                                        child: TextButton(
                                          onPressed: () async {
                                            TimeOfDay? newTime =
                                                await showTimePicker(
                                                    context: context,
                                                    initialTime: startTime);

                                            if (newTime == null) return;
                                            setState(() {
                                              startTime = newTime;
                                            });
                                          },
                                          child: CustomText(
                                              text:
                                                  "Start $startHour:$startMinute"),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 1),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Container(
                                        width: size.width * 0.45,
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8),
                                        child: TextButton(
                                          onPressed: () async {
                                            TimeOfDay? newTime =
                                                await showTimePicker(
                                                    context: context,
                                                    initialTime: stopTime);

                                            if (newTime == null) return;
                                            setState(() {
                                              stopTime = newTime;
                                            });
                                          },
                                          child: CustomText(
                                              text:
                                                  "Stop $stopHour:$stopMinute"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),

                      //where
                      Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText(
                                text: "Where",
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: TextFormField(
                                      controller: where,
                                      cursorColor: Colors.purpleAccent,
                                      decoration: const InputDecoration(
                                        hintText:
                                            "Where the event is taking place",
                                        hintStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9,
                                            fontWeight: FontWeight.w300),
                                        border: InputBorder.none,
                                      ),
                                      style:
                                          const TextStyle(color: Colors.white),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Field can not be empty.';
                                        }
                                        return null;
                                      }),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),

                      //approx zip code
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: "Approx. Zip Code",
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomText(
                                  text: "Approx Area",
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Container(
                                      width: size.width * 0.45,
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: TextFormField(
                                          controller: approxZipCode,
                                          keyboardType: TextInputType.number,
                                          cursorColor: Colors.purpleAccent,
                                          decoration: const InputDecoration(
                                            hintText: "123456",
                                            hintStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 9,
                                                fontWeight: FontWeight.w300),
                                            border: InputBorder.none,
                                          ),
                                          style: const TextStyle(
                                              color: Colors.white),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Zip Code is required.';
                                            } else if (value.length != 6) {
                                              return 'Must be 6 digits.';
                                            }
                                            return null;
                                          }),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Container(
                                      width: size.width * 0.45,
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: TextFormField(
                                          controller: approxArea,
                                          cursorColor: Colors.purpleAccent,
                                          decoration: const InputDecoration(
                                            hintStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 9,
                                                fontWeight: FontWeight.w300),
                                            border: InputBorder.none,
                                          ),
                                          style: const TextStyle(
                                              color: Colors.white),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Can not be empty.';
                                            }
                                            return null;
                                          }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //buttons
                      isLoggedInSelected
                          ? Center(
                              child: LoadingAnimationWidget.staggeredDotsWave(
                                color: Colors.white,
                                size: 45,
                              ),
                            )
                          : CustomButton(
                              text: "Save to BuddeeUp Propositions",
                              onpress: () async {
                                FocusScope.of(context).unfocus();
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    isLoggedInSelected = true;
                                  });
                                  try {
                                    await FirebaseFirestore.instance
                                        .collection('activity')
                                        .doc(auth.currentUser!.uid)
                                        .collection('events')
                                        .doc()
                                        .set(
                                          Activity(
                                                  activityType:
                                                      activityType.text,
                                                  eventName: eventName.text,
                                                  date:
                                                      Timestamp.fromDate(date),
                                                  suggestedTimes: '',
                                                  where: where.text,
                                                  zipcode: approxZipCode.text,
                                                  area: approxArea.text)
                                              .toJson(),
                                        );
                                  } catch (e) {
                                    logger.e(e);
                                    rethrow;
                                  }
                                  // Navigator.of(context).pushAndRemoveUntil(
                                  //   MaterialPageRoute(
                                  //     builder: (_) => const EditProfile(),
                                  //   ),
                                  //   (route) => false,
                                  // );
                                  Navigator.of(context).pop();
                                  setState(() {
                                    isLoggedInSelected = false;
                                  });
                                }
                              },
                              hasBorder: true,
                              buttonColor: Colors.purpleAccent,
                            ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // CustomButton(
                      //   text: "Delete BuddeeUp Propositions",
                      //   onpress: () => Navigator.of(context).pop(),
                      //   buttonColor: Colors.black,
                      // ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDropDown extends StatelessWidget {
  final String title;
  final String desc;
  const CustomDropDown({
    super.key,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8),
      width: size.width * 0.45,
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: title,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 5,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: DropdownButton(
                    value: desc,
                    items: [
                      DropdownMenuItem(
                        value: desc,
                        child: CustomText(
                          text: desc,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      )
                    ],
                    onChanged: (value) {},
                    isExpanded: true,
                    underline: Container(),
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                    dropdownColor: Colors.green,
                    iconEnabledColor: Colors.white, //Icon color
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
