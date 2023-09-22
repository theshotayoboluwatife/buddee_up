import 'package:flutter/material.dart';

import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_text.dart';

class BlockedContactsScreen extends StatefulWidget {
  const BlockedContactsScreen({Key? key}) : super(key: key);

  @override
  State<BlockedContactsScreen> createState() => _BlockedContactsScreenState();
}

class _BlockedContactsScreenState extends State<BlockedContactsScreen> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.clear),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const CustomText(
            text: "Block Contacts",
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 18,
          ),
          actions: [
            Container(
                margin: const EdgeInsets.only(left: 8, right: 8),
                child: IconButton(
                  icon: const Icon(Icons.add),
                  color: Colors.white,
                  onPressed: () {},
                )),
            IconButton(
              icon: const Icon(Icons.more_horiz),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(text: "Contacts"),
              Tab(text: "Blocked"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(16.0),
                  child: const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                      ),
                      hintText: 'Search for a name or number',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide(color: Colors.white, width: 4),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.purpleAccent,
                          // Change this color to your desired color
                          width:
                              2.0, // Change this value to set the border width
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const CustomText(
                  text: "NO contacts found",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: CustomButton(
                    text: 'IMPORT CONTACTS',
                    onpress: () {
                      Navigator.pushNamed(context, "/add_contacts_screen");
                    },
                    buttonColor: Colors.purpleAccent,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text: "ADD MANUAL CONTACT",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer()
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(16.0),
                  child: const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                      ),
                      hintText: 'Search for a name or number',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide(color: Colors.white, width: 4),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        borderSide: BorderSide(
                          color: Colors.purpleAccent,
                          // Change this color to your desired color
                          width:
                              2.0, // Change this value to set the border width
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const CustomText(
                  text:
                      "Users signed into BUDDEEUP with the\ncontact information you add here will be\nblocked",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
