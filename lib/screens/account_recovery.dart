import 'package:BuddeeUp/widgets/custom_button.dart';
import 'package:BuddeeUp/widgets/custom_text_field.dart';
import 'package:BuddeeUp/main.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';

class AccountRecovery extends StatelessWidget {
  AccountRecovery({Key? key}) : super(key: key);

  final TextEditingController _textController = TextEditingController();

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
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  iconSize: 40,
                  icon: const Icon(Icons.arrow_back_outlined),
                  color: Colors.white,
                ),
              ),
            ),
            const CustomText(
              text: "Account recovery",
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(),
            CustomTextField(
                fieldName: "Your email address", myController: _textController),
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              text:
                  "we’ll email you with a link that will instantly recover your account",
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            CustomButton(
              text: "CONTINUE",
              onpress: () async {
                try {
                  await auth.sendPasswordResetEmail(
                    email: _textController.text.trim(),
                  );
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Link sent to your email'),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.toString()),
                    ),
                  );
                }
                // Navigator.pushNamed(context, "/signin");
              },
              textColor: Colors.black,
            ),

            //Spacer()
          ],
        ),
      ),
    );
  }
}
