
import 'package:BuddeeUp/custom_widgets/user_item.dart';
import 'package:BuddeeUp/helpers/get_user_details.dart';
import 'package:BuddeeUp/main.dart';
import 'package:BuddeeUp/screens/discover.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../custom_widgets/custom_text.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Messages",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            // const TextField(
            //   decoration: InputDecoration(
            //     enabled: true,
            //     contentPadding: EdgeInsets.symmetric(vertical: 0),
            //     prefixIcon: Padding(
            //       padding: EdgeInsets.all(15.0),
            //       child: FaIcon(
            //         FontAwesomeIcons.magnifyingGlass,
            //         color: Colors.white,
            //         size: 16,
            //       ),
            //     ),
            //     enabledBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(15),
            //       ),
            //       borderSide: BorderSide(color: Colors.white, width: 1),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(15),
            //       ),
            //     ),
            //     hintText: 'Search',
            //     hintStyle: TextStyle(
            //       color: Colors.white,
            //       fontSize: 12,
            //     ),
            //   ),
            // ),
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
                      StatusCard(
                        name: 'You',
                        image: imageUrl,
                      ),
                      ...data.map(
                        (value) {
                          if (value.id != youData['id']) {
                            return StatusCard(
                              name: (value['profileName'] as String),
                              image: value['imageUrl'],
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
            const Text(
              'Messages',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('chats')
                    .doc(auth.currentUser!.uid)
                    .collection('message-sent')
                    .snapshots(),
                builder: (context, snapshot) {
                  try {
                    List<String> messageIds = [];
                    for (var element in snapshot.data!.docs) {
                      messageIds.add(element.id);
                    }
                    if (snapshot.data!.docs.isEmpty) {
                      return const Center(child: CustomText(text: 'No messages yet', ));
                    } if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: Text('Loading'));
                    }
                    if (snapshot.data == null) {
                      return const Center(child: Text('No messages yet'));
                    }
                    if (snapshot.connectionState == ConnectionState.active) {
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) => UserItem(
                          id: messageIds[index],
                        ),
                        itemCount: messageIds.length,
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  } catch (e) {
                    return const Center(
                      child: Center(child: Text('An Error has occurred')),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
