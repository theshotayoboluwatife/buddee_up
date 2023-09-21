import 'package:BuddeeUp/custom_widgets/custom_button.dart';
import 'package:BuddeeUp/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerification extends StatelessWidget {
  const OTPVerification({Key? key}) : super(key: key);

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
                    icon: const Icon(Icons.keyboard_backspace_outlined, size: 30),
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
            const CustomText(
              text: "Code has been sent to +49 1089 3645 **",
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
            const SizedBox(
              height: 30,
            ),
            PinCodeTextField(
              appContext: context,
              length: 4,
              enableActiveFill: true,
              keyboardType: TextInputType.phone,
              pinTheme: PinTheme(
                inactiveFillColor: Colors.black54,
                inactiveColor: Colors.black54,
                activeFillColor: Colors.white,
                activeColor: Colors.white,
                selectedFillColor: Colors.white,
                borderRadius: BorderRadius.circular(16),
                fieldWidth: 75,
                fieldHeight: 60,
                shape: PinCodeFieldShape.box,
              ),
              cursorColor: Colors.white,
              onChanged: (value) {},
              onCompleted: (value) {},
            ),
            const SizedBox(
              height: 40,
            ),
            const CustomText(
              text: "Resend code in",
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
            const Spacer(),
            CustomButton(
              text: "CONTINUE",
              onpress: () {
                Navigator.pushNamed(context, "/welcome");
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
