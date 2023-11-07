import 'package:BuddeeUp/widgets/app_grid_view.dart';
import 'package:BuddeeUp/widgets/filter_button.dart';
import 'package:BuddeeUp/helpers/get_user_details.dart';
import 'package:BuddeeUp/main.dart';
import 'package:BuddeeUp/models/new_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';

class DiscoveryPage extends StatelessWidget {
  const DiscoveryPage({
    super.key,
  });

  // final List<StatusData> statusData;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      key: const ValueKey('value1'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: "Discover",
                  color: Color(0XFFC420D2),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0XFF4E1753).withOpacity(.94),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                              "assets/images/ri_compass-discover-fill.png"),
                          const SizedBox(
                            width: 5,
                          ),
                          const CustomText(
                            text: "Travel Pass",
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 14,
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        FutureBuilder(
                          future: GetUserDetails().getUserProfileImage(),
                          builder: (_, snapShot) {
                            if (snapShot.connectionState ==
                                ConnectionState.waiting) {
                              return Container();
                            }
                            if (snapShot.hasError) {
                              return Container();
                            }
                            return GestureDetector(
                              child: ClipOval(
                                child: Image.network(
                                  snapShot.data!,
                                  fit: BoxFit.cover,
                                  cacheWidth: 30,
                                  cacheHeight: 30,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(),
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, "/user_profile");
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        FilterButton(size: size),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 90,
                  child: FutureBuilder(
                    future: GetUserDetails().getUsers(),
                    builder: (_, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container();
                      }
                      List<QueryDocumentSnapshot<Map<String, dynamic>>>? data =
                          snapshot.data?.docs;

                      var you = data!.firstWhere(
                          (element) => element.id == auth.currentUser!.uid);
                      var youData = you.data();
                      var imageUrl = youData['imageUrl'];
                      return ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, "/user_profile"),
                            child: StatusCard(
                              name: 'You',
                              image: imageUrl,
                            ),
                          ),
                          ...data.map(
                            (value) {
                              if (value.id != youData['id']) {
                                return GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    "/user_profile_info",
                                    arguments: NewUser.fromJson(
                                      value.data(),
                                    ),
                                  ),
                                  child: StatusCard(
                                    name: (value['profileName'] as String),
                                    image: value['imageUrl'],
                                  ),
                                );
                              }
                              return Container();
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const AppGridView(
              route: "/user_profile_info",
            )
          ],
        ),
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  const StatusCard({
    super.key,
    required this.name,
    required this.image,
  });

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0XFFC420D2),
                    Color(0XFF0A84FF),
                  ],
                ),
              ),
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          FittedBox(
            alignment: Alignment.center,
            child: CustomText(
              text: name,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
