import 'package:flutter/material.dart';

import '../custom_widgets/custom_text.dart';

class PropositionScreen extends StatelessWidget {
  const PropositionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomText(text: "HANDLE PROPOSITION SCREEN", fontSize: 30, fontWeight: FontWeight.bold, color: Colors.purpleAccent),
      ),
    );
  }
}
