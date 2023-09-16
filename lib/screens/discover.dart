import 'package:flutter/material.dart';

import '../custom_widgets/custom_text.dart';

class DiscoverPage extends StatelessWidget {
  DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SafeArea(
              child:

              Container(
                child: Column(
                  children: [
                    CustomText(
                  text: "Discover",
                  color: Color(0xFFDA3EE8),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                    SizedBox(height: 10,),
                    Row(children: [],)
              ],
            ),
          ),

          )
        ],
      ),
    );
  }
}
