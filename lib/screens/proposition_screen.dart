import 'package:BuddeeUp/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/custom_text.dart';

class PropositionScreen extends StatelessWidget {
  const PropositionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
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
                child: ListView(
                  children: [
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
                                        left: 30, right: 30),
                                    child: DropdownButton(
                                      value: "Fetishes/Groups",
                                      items: const [
                                        DropdownMenuItem(
                                          value: "Fetishes/Groups",
                                          child: CustomText(
                                            text: "Fetishes/Groups",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10,
                                          ),
                                        )
                                      ],
                                      onChanged: (value) {},
                                      isExpanded: true,
                                      underline: Container(),
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.white),
                                      dropdownColor: Colors.green,
                                      iconEnabledColor:
                                          Colors.white, //Icon color
                                    ))),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        CustomDropDown(
                            title: "Event Name",
                            desc: "Create a name for your event"),
                        CustomDropDown(title: "Date", desc: "23-02-01"),
                      ],
                    ),
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
                            DecoratedBox(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 30),
                                    child: DropdownButton(
                                      value: "suggested_time",
                                      items: const [
                                        DropdownMenuItem(
                                            value: "suggested_time",
                                            child: CustomText(
                                              text: "Start: 12:03   Stop: 1:03",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                              textAlign: TextAlign.start,
                                            ))
                                      ],
                                      onChanged: (value) {},
                                      isExpanded: true,
                                      underline: Container(),
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.white),
                                      dropdownColor: Colors.green,
                                      iconEnabledColor:
                                          Colors.white, //Icon color
                                    ))),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
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
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 30),
                                    child: DropdownButton(
                                      value: "where",
                                      items: const [
                                        DropdownMenuItem(
                                            value: "where",
                                            child: CustomText(
                                              text:
                                                  "Where the event is taking place",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                              textAlign: TextAlign.start,
                                            ))
                                      ],
                                      onChanged: (value) {},
                                      isExpanded: true,
                                      underline: Container(),
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.white),
                                      dropdownColor: Colors.green,
                                      iconEnabledColor:
                                          Colors.white, //Icon color
                                    ))),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        CustomDropDown(
                            title: "Aprox. Zip code", desc: "123456"),
                        CustomDropDown(title: "Aprox. Area", desc: ""),
                      ],
                    ),
                    CustomButton(
                      text: "Save to BudddeeUp Propositions",
                      onpress: () => Navigator.of(context).pop(),
                      hasBorder: true,
                      buttonColor: Colors.purpleAccent,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      text: "Delete BudddeeUp Propositions",
                      onpress: () => Navigator.of(context).pop(),
                      buttonColor: Colors.black,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
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
                        style:
                            const TextStyle(fontSize: 14, color: Colors.white),
                        dropdownColor: Colors.green,
                        iconEnabledColor: Colors.white, //Icon color
                      ))),
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
