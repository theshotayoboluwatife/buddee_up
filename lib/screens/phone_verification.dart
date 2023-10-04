import 'package:BuddeeUp/custom_widgets/custom_button.dart';
import 'package:BuddeeUp/custom_widgets/custom_text.dart';
import 'package:BuddeeUp/main.dart';
import 'package:BuddeeUp/providers/create_new_user.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:provider/provider.dart';

class PhoneVerification extends StatefulWidget {
  PhoneVerification({Key? key}) : super(key: key);

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  late PhoneNumber phoneNumber;

  @override
  Widget build(BuildContext context) {
    CreateNewUser createNewUser = Provider.of<CreateNewUser>(context);
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
                    text: "Phone verification",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: IntlPhoneField(
                decoration: const InputDecoration(
                  hintText: "Enter your mobile number",
                  counterText: '',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white, // Background color
                ),
                initialCountryCode: 'US',
                onChanged: (PhoneNumber number) {
                  phoneNumber = number;
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomText(
              text:
                  "When you tap Continue, BUDDEEUP will send a verification code. Message and data rates may apply. The verified phone number can be used to login. Learn what happens when your number changes",
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
              text: "CONTINUE",
              onpress: () async {
                try {
                  await auth.verifyPhoneNumber(
                    phoneNumber: phoneNumber.completeNumber,
                    verificationCompleted: (p) {},
                    verificationFailed: (p) {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Code Verification Failed'),
                        ),
                      );
                    },
                    codeSent: (verificationId, forceResendingToken) {
                      createNewUser.phone(phoneNumber.completeNumber);
                      Navigator.pushNamed(
                        context,
                        '/otp_verification',
                        arguments: verificationId,
                      );
                    },
                    codeAutoRetrievalTimeout: (verificationId) {},
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Enter A Valid Phone Number'),
                    ),
                  );
                }
              },
              buttonColor: Colors.white,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
