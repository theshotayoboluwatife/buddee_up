import 'dart:convert';

import 'package:BuddeeUp/helpers/get_user_details.dart';
import 'package:BuddeeUp/main.dart';
import 'package:BuddeeUp/models/user.dart';
import 'package:BuddeeUp/providers/status_provider.dart';
import 'package:BuddeeUp/screens/chat/chat_screen.dart';
import 'package:BuddeeUp/screens/discover.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    final statusData = Provider.of<Status>(context).statusData;

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
            const TextField(
              decoration: InputDecoration(
                enabled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
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
              key: const ValueKey('value'),
              child: ListView.builder(
                itemBuilder: (_, i) {
                  return Column(
                    children: [
                      FutureBuilder(
                        future: getUsers(),
                        builder: (_, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container();
                          }
                          if (snapshot.data == null) {
                            return Container();
                          }

                          return GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const ChatScreen(),
                              ),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
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
                                              image: NetworkImage(
                                                  snapshot.data!.imageUrl),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    snapshot.data!.name,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  subtitle: const Text(
                                    "You: Hello how are you",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                  trailing: Column(
                                    children: [
                                      const Text(
                                        '23 min',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      const Spacer(),
                                      CircleAvatar(
                                        radius: 12,
                                        backgroundColor: const Color.fromARGB(
                                                255, 211, 59, 206)
                                            .withOpacity(0.96),
                                        child: const Text(
                                          '2',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 100.0),
                                  child: Divider(
                                      color: Colors.white, thickness: 1.2),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
                itemCount: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<User> getUsers() async {
  var response = await http.get(Uri.parse('https://randomuser.me/api/'));
  var name = json.decode(response.body)['results'][0]['name']['first'];
  var imageUrl = json.decode(response.body)['results'][0]['picture']['medium'];
  var age = json.decode(response.body)['results'][0]['dob']['age'];
  User user = User(name, imageUrl, age);
  return user;
}

// List<User> users = [
//   User("Emelie", "assets/dps/0.png", 10),
//   User("Abigali", "assets/dps/1.png", 10),
//   User("Elizabeth", "assets/dps/2.png", 10),
//   User("Penelope", "assets/dps/3.png", 10),
//   User("Chole", "assets/dps/4.png", 10),
//   User("Grace", "assets/dps/5.png", 10),
// ];
