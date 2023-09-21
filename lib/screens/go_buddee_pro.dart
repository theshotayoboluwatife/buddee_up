import 'package:BuddeeUp/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/custom_text.dart';

class GoPro extends StatelessWidget {
  const GoPro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
       body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SafeArea(
              child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: [
              CustomText(text: "Go BuddeeUp Pro",
              color: Colors.purpleAccent,
              fontWeight: FontWeight.bold,
              fontSize: 24,),
              SizedBox(width: 5,),
              Icon(Icons.verified, size: 35, color: Colors.purpleAccent,)
            ],
          )),
          const SizedBox(height: 30,),
          Container(),
          const CustomText(text: "Calls Duration", fontSize: 24, fontWeight: FontWeight.bold,),
          const CustomText(text: "Get free video calls duration every day", fontSize: 16, fontWeight: FontWeight.w400,),
          const SizedBox(height: 16,),
          //replace with actual page indicator
          Container(
            padding: const EdgeInsets.only(left: 100, right: 100),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.circle, color: Colors.purpleAccent, size: 16,),
                Icon(Icons.circle, color: Colors.white, size: 16,),
                Icon(Icons.circle, color: Colors.white, size: 16,),
                Icon(Icons.circle, color: Colors.white, size: 16,),
                Icon(Icons.circle, color: Colors.white, size: 16,),
                Icon(Icons.circle, color: Colors.white, size: 16,),
              ],
            ),
          ),
          SizedBox(height: 30,),
          CustomText(text: "Subscribe", fontSize: 24, fontWeight: FontWeight.bold,),
          SizedBox(height: 30,),
          CustomText(text: "Try for free. Then upgrade to pro", fontSize: 16, fontWeight: FontWeight.w400,),
          SizedBox(height: 10,),



        ],
      ),
    );
  }
}
