import 'package:BuddeeUp/custom_widgets/custom_button.dart';
import 'package:BuddeeUp/custom_widgets/custom_text.dart';
import 'package:BuddeeUp/helpers/get_user_details.dart';
import 'package:BuddeeUp/models/new_user.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            width: double.infinity,
           // height: size.height * 0.65,
            decoration: const BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: SafeArea(
              child: FutureBuilder(
                future: GetUserDetails().getUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Container();
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container();
                  }
                  NewUser user = NewUser.fromJson(snapshot.data!.data()!);

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Column(
                      children: [
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CustomText(
                                text: "BUDDEEUP",
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              Stack(
                                children: [
                                  Positioned(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white, // Border color
                                          width: 1.0, // Border width
                                        ),
                                      ),
                                      child: ClipOval(
                                        child: Image.network(
                                          user.imageUrl,
                                          width: 220,
                                          height: 220,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Positioned(
                                  //   right: 0,
                                  //   top: 0,
                                  //   child: Container(
                                  //     padding: const EdgeInsets.all(16),
                                  //     decoration: BoxDecoration(
                                  //       color: const Color(0xff141416),
                                  //       shape: BoxShape.circle,
                                  //       border: Border.all(
                                  //         color: Colors.white, // Border color
                                  //         width: 1.0, // Border width
                                  //       ),
                                  //     ),
                                  //     child: const ClipOval(
                                  //       child: CustomText(
                                  //         text: "45%",
                                  //         fontWeight: FontWeight.bold,
                                  //         fontSize: 16,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    text: "${user.profileName}, ${user.age}",

                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  const Icon(
                                    Icons.verified,
                                    color: Colors.black,
                                    size: 24,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 80.0, right: 80),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        CustomText(
                                          text: "0",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        CustomText(
                                          text: "Following",
                                          fontWeight: FontWeight.w300,
                                        )
                                      ],
                                    ),
                                    CustomText(text: "|"),
                                    Column(
                                      children: [
                                        CustomText(
                                          text: "0",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        CustomText(
                                          text: "Followers",
                                          fontWeight: FontWeight.w300,
                                        )
                                      ],
                                    ),
                                    CustomText(text: "|"),
                                    Column(
                                      children: [
                                        CustomText(
                                          text: "0",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        CustomText(
                                          text: "Likes",
                                          fontWeight: FontWeight.w300,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 24.0, right: 24, bottom: 16),
                                child: Row(

                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [

                                    Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.settings,
                                              size: 40,
                                              color: Colors.black,
                                            ),
                                            onPressed: () {
                                              //it w1orks
                                              Navigator.pushNamed(context, "/settings");
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const CustomText(
                                          text: "SETTINGS",
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.edit,
                                              size: 40,
                                              color: Colors.black,
                                            ),
                                            onPressed: () {
                                              Navigator.pushNamed(context, "/edit_info");
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const CustomText(
                                          text: "EDIT PROFILE",
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.verified,
                                              size: 40,
                                              color: Colors.black,
                                            ),
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, "/go_pro_screen");
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const CustomText(
                                          text: "PRO",
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      border: Border.all(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(8),
                    width: double.infinity,
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle,
                          color: Colors.white,
                          size: 35,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CustomText(
                          text: "Make Your Buddeeup Proposition",
                          fontWeight: FontWeight.w400,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/proposition_screen");
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: "BUDDEEUP PRO",
                  color: Colors.purpleAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                const SizedBox(
                  height: 8,
                ),
                const CustomText(
                  text: "Get free video calls duration",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(
                  height: 16,
                ),
                //replace with actual page indicator
                Container(
                  padding: const EdgeInsets.only(left: 100, right: 100),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.purpleAccent,
                        size: 16,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.white,
                        size: 16,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.white,
                        size: 16,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.white,
                        size: 16,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.white,
                        size: 16,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomButton(
                    text: "LEARN MORE",
                    onpress: () {
                      Navigator.pushNamed(context, "/go_pro_screen");
                    },
                    buttonColor: Colors.purpleAccent,
                    width: size.height * 0.3),
                const SizedBox(
                  height: 150,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
