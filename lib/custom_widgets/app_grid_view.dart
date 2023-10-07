import 'dart:ui';

import 'package:BuddeeUp/helpers/get_user_details.dart';
import 'package:BuddeeUp/models/new_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppGridView extends StatelessWidget {
  final String route;
  const AppGridView({
    super.key,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: GetUserDetails().getUsersInGridView(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          }
          if (snapshot.hasError) {
            return Container();
          }
          return GridView.builder(
            key: Key(DateTime.now().toString()),
            itemCount: snapshot.data!.docs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 150 / 180,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16),
            itemBuilder: (_, i) => FutureBuilder(
              future: GetUserDetails().getUsersInGridView(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.all(45.0),
                    child: CircularProgressIndicator(
                      color: Colors.purple,
                    ),
                  );
                }
                List<QueryDocumentSnapshot<Map<String, dynamic>>>? data =
                    snapshot.data?.docs;

                NewUser user = NewUser.fromJson(
                  data![i].data(),
                );

                return GestureDetector(
                  child: GridTile(
                    header: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 60),
                        Text(
                          user.profileName,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '${user.age}',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    footer: ClipRect(
                      clipBehavior: Clip.hardEdge,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.2),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.x,
                                size: 12,
                                color: Colors.white,
                              ),
                              Container(
                                height: 30,
                                width: 2,
                                color: Colors.white,
                              ),
                              const FaIcon(
                                FontAwesomeIcons.solidHeart,
                                color: Colors.white,
                                size: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(user.imageUrl),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/user_profile_info',
                        arguments: user);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
