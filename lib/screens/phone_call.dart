import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';

class PhoneCallScreen extends StatelessWidget {
  const PhoneCallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body:
      Column(
        children: [
          SafeArea(
            child:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.navigate_before,
                        size: 45,
                        color: Colors.white,
                      )),
                  SizedBox(
                    width: size.width * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.lock,
                            color: Colors.white,
                            size: 18,
                          ),
                          alignment: Alignment.centerRight),
                      const CustomText(
                        text: 'End to end encryption',
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ],
                  ),
                ],
              ),
          ),
          const SizedBox(height: 20,),
          const CustomText(text: "Annabelle", fontSize: 24,fontWeight: FontWeight.bold,),
          const SizedBox(height: 10,),
          const CustomText(text: "12:34", fontSize: 16,fontWeight: FontWeight.w400,),
          const Spacer(),
          ClipOval(
            child: Image.asset(
              'assets/images/annabelle.png',
              width: 220,
              height: 220,
              fit: BoxFit.cover,
            ),
          ),
          const Spacer(),
          const SizedBox(height: 160,),
          Container(
            decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                    width: 1,
                    color: Colors.white
                ),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.cameraswitch_outlined, size: 40, color: Colors.white,)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.video_camera_back,size: 40, color: Colors.white,)),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.red[600], // Background color
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  child: const Icon(
                    Icons.call_end,
                    size: 40,
                    color: Colors.white, // Icon color
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.mic,size: 40, color: Colors.white,)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.thumbs_up_down_sharp,size: 40, color: Colors.white,)),
              ],
            ),
          )


        ],
      )
    );
  }
}
