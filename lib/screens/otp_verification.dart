import 'package:BuddeeUp/custom_widgets/custom_button.dart';
import 'package:BuddeeUp/custom_widgets/custom_text.dart';
import 'package:BuddeeUp/helpers/logger.dart';
import 'package:BuddeeUp/main.dart';
import 'package:BuddeeUp/providers/create_new_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;
    CreateNewUser newUser = Provider.of<CreateNewUser>(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(227, 127, 236, 0.96),
              // rgba(227.15, 126.78, 235.88, 0.96)
              Color.fromRGBO(196, 32, 210, 0.96),
              // rgba(196.07, 31.56, 210.37, 0.96)
              Color.fromRGBO(163, 11, 176, 0.96),
              // rgba(163.15, 11.02, 176.37, 0.96)
            ],
          ),
        ),
        child: Column(
          children: [
            SafeArea(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon:
                        const Icon(Icons.keyboard_backspace_outlined, size: 30),
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const CustomText(
                    text: "Enter OTP Code",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            const Spacer(),
            CustomText(
              text: "Code has been sent to ${newUser.newUser.phoneNumber}",
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
            const SizedBox(
              height: 30,
            ),
            PinCodeTextField(
              appContext: context,
              length: 6,
              enableActiveFill: true,
              keyboardType: TextInputType.phone,
              pinTheme: PinTheme(
                inactiveFillColor: Colors.black54,
                inactiveColor: Colors.black54,
                activeFillColor: Colors.white,
                activeColor: Colors.white,
                selectedFillColor: Colors.white,
                borderRadius: BorderRadius.circular(16),
                fieldWidth: 50,
                fieldHeight: 60,
                shape: PinCodeFieldShape.box,
              ),
              cursorColor: Colors.white,
              onChanged: (value) {},
              onCompleted: (value) {},
              controller: pinController,
            ),
            const SizedBox(
              height: 40,
            ),
            TimerCountdown(
              format: CountDownTimerFormat.minutesSeconds,
              endTime: DateTime.now().add(
                const Duration(
                  minutes: 2,
                  seconds: 0,
                ),
              ),
              colonsTextStyle: const TextStyle(color: Colors.white),
              timeTextStyle: const TextStyle(color: Colors.white),
              descriptionTextStyle: const TextStyle(color: Colors.white),
              onEnd: () {
                print("Timer finished");
              },
            ),
            const Spacer(),
            CustomButton(
              text: "CONTINUE",
              onpress: () {
                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: args.toString(),
                    smsCode: pinController.text,
                  );

                  if (credential.smsCode!.isNotEmpty) {
                    logger.i(args);
                    Navigator.pushNamed(context, "/welcome");
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Code Verification Failed'),
                    ),
                  );
                }
              },
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
