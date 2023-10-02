import 'dart:ui';
import 'package:BuddeeUp/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import '../custom_widgets/custom_text.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const ChatScreen(name: "name", imageUrl: "imageUrl")),
          );
        },
        backgroundColor: Colors.purpleAccent,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.message_sharp,
          color: Colors.white,
        ),
      ),
      body: ListView(children: [
        Container(
          color: Colors.black,
          padding: const EdgeInsets.only(left: 4, right: 4),
          child: Stack(
            children: [
              Container(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  width: double.infinity,
                  height: size.height * 0.45,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    child: Image.asset(
                      "assets/images/profile_info1.png",
                      fit: BoxFit.cover,
                      width: 60,
                      height: size.height * 0.8,
                    ),
                  )),
              Positioned(
                top: 5,
                //page_indicator
                child: Container(),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: IconButton(
                  icon: const CircleAvatar(
                      minRadius: 20,
                      backgroundColor: Colors.purpleAccent,
                      foregroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 20,
                      )),
                  onPressed: () {},
                ),
              ),
              Positioned(
                  top: 0,
                  left: 24,
                  child: IconButton(
                    iconSize: 50,
                    icon: const Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CustomText(
                    text: "Anabelle 19",
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.verified,
                    color: Colors.purple,
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Row(
                children: [
                  CustomText(
                    text: "2 hrs ago",
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.green,
                    size: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const CustomText(
                text: "60mi away",
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomText(
                text: "ABOUT ME",
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
              const SizedBox(
                height: 14,
              ),
              const CustomText(
                text:
                    "Hey guys, This is Anabelle. I’m here to find someone for hookup. I’m not interested in something serious. I would love to hear your adventurous story.",
                fontWeight: FontWeight.w300,
                fontSize: 12,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/fa-solid_mask.png",
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const CustomText(
                    text: "Top/Average",
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/ion_speedometer.png",
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const CustomText(
                    text: "33yrs/5'ft 0\"in",
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/material-symbols_ecg-heart.png",
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const CustomText(
                    text: "Married",
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/multilang.png",
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const CustomText(
                    text: "African-American/English",
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.place,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  CustomText(
                    text: "United States",
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text: 'LOOKING FOR',
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff141416),
                  ),
                  child: const CustomText(
                    text: "Hookup",
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const CustomText(
                text: 'ACTIVITIES',
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff141416),
                      ),
                      child: CustomText(
                        text: "Coffee Talks/Drinks/Happy Hours",
                        fontSize: 12,
                        color: Colors.purple[300],
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff141416),
                      ),
                      child: CustomText(
                        text: "SPA",
                        fontSize: 12,
                        color: Colors.purple[300],
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff141416),
                      ),
                      child: CustomText(
                        text: "Fetishes/Groups",
                        color: Colors.purple[300],
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff141416),
                      ),
                      child: CustomText(
                        text: "Cafe Hopping",
                        fontSize: 12,
                        color: Colors.purple[300],
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomText(
                text: 'PRIVATE PHOTOS',
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/prof1.png'),
                                  fit: BoxFit.cover)),
                        ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                  sigmaX: 2,
                                  sigmaY:
                                      2), // Adjust the sigma values for blur intensity
                              child: Container(
                                width: 50,
                                height: 50,
                                color: Colors
                                    .transparent, // Make the blurred container transparent
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Icon(
                              Icons.lock,
                              color: Colors.purple,
                              size: 35,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                              color: Colors.green,
                              image: DecorationImage(
                                  image: AssetImage('assets/images/prof1.png'),
                                  fit: BoxFit.cover)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 35),
                              child: Container(
                                  color: Colors.transparent,
                                  child: Image.asset(
                                    "assets/images/prof3.png",
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                  sigmaX: 2,
                                  sigmaY:
                                      2), // Adjust the sigma values for blur intensity
                              child: Container(
                                width: 50,
                                height: 50,
                                color: Colors
                                    .transparent, // Make the blurred container transparent
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Icon(
                              Icons.lock,
                              color: Colors.purple,
                              size: 35,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/prof3.png'),
                                  fit: BoxFit.cover)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 35),
                              child: Container(
                                  color: Colors.transparent,
                                  child: Image.asset(
                                    "assets/images/prof2.png",
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                  sigmaX: 2,
                                  sigmaY:
                                      2), // Adjust the sigma values for blur intensity
                              child: Container(
                                width: 50,
                                height: 50,
                                color: Colors
                                    .transparent, // Make the blurred container transparent
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Icon(
                              Icons.lock,
                              color: Colors.purple,
                              size: 35,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/view_image");
                },
              ),
              const SizedBox(
                height: 32,
              ),
              Center(
                child: Column(
                  children: [
                    const CustomText(
                      text: "SHARE ROMA'S PROFILE",
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const CustomText(
                      text: "SEE WHAT A FRIEND THINKS",
                      fontWeight: FontWeight.w300,
                      fontSize: 9,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const CustomText(
                      text: "REPORT ROMA",
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.cancel_rounded,
                          color: Colors.white,
                          size: 50,
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
