import 'package:BuddeeUp/screens/chat.dart';
import 'package:BuddeeUp/screens/discover.dart';
import 'package:BuddeeUp/screens/edit_profile.dart';
import 'package:BuddeeUp/screens/go_buddee_pro.dart';
import 'package:BuddeeUp/screens/go_buddeeup.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController(initialPage: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(controller: pageController, children: const [
        Chat(),
        GoBuddeeUp(),
        DiscoveryPage(),
        GoPro(),
        EditProfile(),
      ]),
      // body: DiscoveryPage(),
      bottomSheet: Container(
        height: 85,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  pageController.jumpToPage(0);
                });
              },
              child: const Icon(
                Icons.message_rounded,
                size: 28,
                color: Color(0XFF99A3B0),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  pageController.jumpToPage(1);
                });
              },
              child: const Icon(
                Icons.group,
                size: 28,
                color: Color(0XFF99A3B0),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  pageController.jumpToPage(2);
                });
              },
              child: Container(
                height: 58,
                width: 58,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/navLogo.png'),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  pageController.jumpToPage(3);
                });
              },
              child: const FaIcon(
                Icons.upload,
                size: 28,
                color: Color(0XFF99A3B0),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  pageController.jumpToPage(4);
                });
              },
              child: const Icon(
                Icons.person,
                size: 28,
                color: Color(0XFF99A3B0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
