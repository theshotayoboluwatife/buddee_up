import 'package:flutter/material.dart';

import '../custom_widgets/custom_text.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomText(text: "HANDLE SETTINGS SCREEN", fontSize: 30, fontWeight: FontWeight.bold, color: Colors.purpleAccent),
      ),
    );
  }
}
