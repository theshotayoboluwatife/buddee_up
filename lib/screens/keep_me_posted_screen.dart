import 'package:BuddeeUp/widgets/custom_button.dart';
import 'package:BuddeeUp/helpers/fire_store.dart';
import 'package:BuddeeUp/helpers/logger.dart';
import 'package:BuddeeUp/main.dart';
import 'package:BuddeeUp/providers/create_new_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/custom_text.dart';

class KeepMePosted extends StatelessWidget {
  const KeepMePosted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createNewUser = Provider.of<CreateNewUser>(context);

    return Scaffold(
      backgroundColor: Colors.deepPurple,
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
                    ))),
            const SizedBox(
              height: 30,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(child: Image.asset("assets/images/Ellipse4.png")),
                Positioned(
                  child: Image.asset("assets/images/Frame4.png"),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              text: "Keep me posted",
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              text: "Find out when you get a message",
              fontSize: 15,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            CustomButton(
              text: "I WANT TO BE NOTIFIED",
              onpress: () async {
                try {
                  createNewUser.newUser.id = auth.currentUser!.uid;
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool('isUserLoggedIn', true);
                  logger.i(prefs.getBool('isUserLoggedIn'));
                  await FireStore()
                      .addUserToDatabase(createNewUser.newUser.toJson());
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/home_screen',
                    (route) => false,
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.toString()),
                    ),
                  );
                }
              },
              textColor: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  text: "TELL ME MORE",
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_drop_down_outlined),
                  color: Colors.white,
                  iconSize: 30,
                )
              ],
            ),
            //Spacer()
          ],
        ),
      ),
    );
  }
}
