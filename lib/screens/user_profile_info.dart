import 'dart:math';
import 'dart:ui';
import 'package:BuddeeUp/helpers/fire_store.dart';
import 'package:BuddeeUp/models/new_user.dart';
import 'package:BuddeeUp/screens/chat/chat_screen.dart';
import 'package:choice/choice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../widgets/custom_text.dart';
import 'package:timeago/timeago.dart' as timeago;

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewUser userInfo = ModalRoute.of(context)?.settings.arguments as NewUser;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChatScreen(),
              settings: RouteSettings(
                arguments: userInfo,
              ),
            ),
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
                    child: Image.network(
                      userInfo.imageUrl,
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
                    ),
                  ),
                  onPressed: () async {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('User Succesfully Adeed'),
                      ),
                    );
                    await FireStore().addUserToFriendList({
                      'friends': FieldValue.arrayUnion([userInfo.id]),
                    });
                  },
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
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomText(
                    text: '${userInfo.profileName} ${userInfo.age}',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.verified,
                    color: Colors.purple,
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  CustomText(
                    text: timeago.format(userInfo.lastSeen.toDate()),
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  const Icon(
                    Icons.circle,
                    color: Colors.green,
                    size: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              CustomText(
                text: "${Random().nextInt(75)} mi away",
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
              CustomText(
                text: userInfo.bio,
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
                  CustomText(
                    text: userInfo.sexualPreferences,
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
                  CustomText(
                    text: userInfo.age.toString(),
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
                  CustomText(
                    text: userInfo.status,
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
                  CustomText(
                    text: userInfo.tribe,
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
                  const Icon(
                    Icons.place,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  FutureBuilder(
                    future: geCountryUrl(userInfo.phoneNumber),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container();
                      }
                      if (!snapshot.hasData) {
                        return Container();
                      }
                      return CustomText(
                        text: snapshot.data!,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      );
                    },
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
                  child: CustomText(
                    text: userInfo.lookingFor,
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
              InlineChoice<String>.multiple(
                clearable: true,
                // value: selectedValue,
                onChanged: (value) {},
                itemCount: userInfo.activities.length,
                itemBuilder: (selection, i) {
                  return ChoiceChip(
                    label: Text(
                      userInfo.activities[i],
                      style:
                          const TextStyle(color: Colors.purple, fontSize: 14),
                    ),
                    color: const MaterialStatePropertyAll(
                      Colors.white,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    selected: false,
                  );
                },
                listBuilder: ChoiceList.createWrapped(
                  spacing: 8,
                  runSpacing: 8,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                ),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...userInfo.pictures.map(
                        (imageUrl) => Row(
                          children: [
                            GestureDetector(
                              child: Stack(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      image: DecorationImage(
                                        image: NetworkImage(imageUrl),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 10, sigmaY: 35),
                                        child: Container(
                                            color: Colors.transparent,
                                            child: Image.network(
                                              imageUrl,
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
                                                .transparent // Make the blurred container transparent
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
                              onTap: () => Navigator.pushNamed(
                                  context, "/view_image",
                                  arguments: imageUrl),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Center(
                child: Column(
                  children: [
                    CustomText(
                      text: "SHARE ${userInfo.profileName} PROFILE",
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
                    CustomText(
                      text: "REPORT ${userInfo.profileName}",
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

  Future<String> geCountryUrl(String number) async {
    String phoneNumber = '+234 500 500 5005';
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber);
    return number.isoCode!;
  }
}
