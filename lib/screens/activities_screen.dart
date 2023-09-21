import 'package:flutter/material.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_text.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

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
              Color.fromRGBO(227, 127, 236, 0.96),
              Color.fromRGBO(196, 32, 210, 0.96),
              Color.fromRGBO(163, 11, 176, 0.96), // rgba(163.15, 11.02, 176.37, 0.96)
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
                      onPressed: () {},
                      icon: const Icon(Icons.clear),
                      color: Colors.white,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top:24.0, left: 8),
                      child: CustomText(text: "Activities", fontSize: 36, fontWeight: FontWeight.w600,),
                    ),
                  ]),
            ),

            const Spacer(),
            CustomButton(text: "CONTINUE", textColor: Colors.black, onpress: (){Navigator.pushNamed(context, "/sexual_preference_screen");}, width: double.infinity,buttonColor: Colors.white,),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }}
