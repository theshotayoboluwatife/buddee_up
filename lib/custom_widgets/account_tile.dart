import 'package:flutter/material.dart';

import 'custom_text.dart';

class AccountTile extends StatelessWidget {
  const AccountTile(
      {Key? key,
        required this.name,
        required this.email,
        required this.image})
      : super(key: key);

  final String name;
  final String email;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: ListTile(
              leading: image,
              title: CustomText(text: name,fontWeight: FontWeight.w600,color: Colors.black, fontSize: 16, ),
              subtitle: CustomText(text: email,fontWeight: FontWeight.w400,color: Colors.black, fontSize: 11, ),
              onTap: () {},
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey, // Choose your border color
                  width: 0.5, // Choose your border width
                ),
              ),
            ),
          ), //    CustomText()
        ],
      ),
    );
  }
}
