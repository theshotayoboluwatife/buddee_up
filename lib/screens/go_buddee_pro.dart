import 'package:BuddeeUp/screens/account_page.dart';
import 'package:BuddeeUp/screens/edit_profile.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/custom_text.dart';

class GoPro extends StatelessWidget {
  const GoPro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SafeArea(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Go BuddeeUp Pro",
                    color: Colors.purpleAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  SizedBox(height: 25),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.verified,
                    size: 35,
                    color: Colors.purpleAccent,
                  )
                ],
              )),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 65,
                height: 65,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/call.png'),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const CustomText(
                text: "Calls Duration",
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              const CustomText(
                text: "Get free video calls duration every day",
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(
                height: 16,
              ),
              //replace with actual page indicator
              Container(
                padding: const EdgeInsets.only(left: 150, right: 150),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.circle,
                      color: Colors.purpleAccent,
                      size: 8,
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.white.withOpacity(0.5),
                      size: 8,
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.white.withOpacity(0.55),
                      size: 8,
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.white.withOpacity(0.5),
                      size: 8,
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.white.withOpacity(0.5),
                      size: 8,
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.white.withOpacity(0.5),
                      size: 8,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomText(
                text: "Subscribe",
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomText(
                text: "Try for free. Then upgrade to pro",
                fontSize: 16,
                color: Colors.white.withOpacity(0.65),
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0XFF0A84FF),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    'Start Free Trial Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0XFFC420D2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Month',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '\$2.99',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),

              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0XFFC420D2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Year',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '\$12.99',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const EditProfile(),
                  ),
                ),
                child: CustomText(
                  text: "No, thank you",
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.65),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              CustomText(
                text: "Restore | Privacy | Terms Of Services",
                fontSize: 16,
                color: Colors.white.withOpacity(0.65),
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
