import 'dart:convert';
import 'dart:ui';

import 'package:BuddeeUp/models/user.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart' as http;

Future<User> getUsers() async {
  var response = await http.get(Uri.parse('https://randomuser.me/api/'));
  var name = json.decode(response.body)['results'][0]['name']['first'];
  var imageUrl = json.decode(response.body)['results'][0]['picture']['medium'];
  var age = json.decode(response.body)['results'][0]['dob']['age'];
  User user = User(name, imageUrl, age);
  return user;
}

class AppGridView extends StatelessWidget {
  const AppGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 15,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 150 / 180,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16),
        itemBuilder: (_, i) => FutureBuilder(
          future: getUsers(),
          builder: (_, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return const Padding(
                padding: EdgeInsets.all(45.0),
                child: CircularProgressIndicator(
                  color: Colors.purple,
                ),
              );
            }
            return GridTile(
              header: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  Text(
                    "${snapShot.data!.age.toString()[1]}mi",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "${snapShot.data!.name}, ${snapShot.data!.age}",
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
                    image: NetworkImage(snapShot.data!.imageUrl),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
