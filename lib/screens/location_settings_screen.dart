import 'package:flutter/material.dart';

import '../custom_widgets/custom_text.dart';

class LocationSettings extends StatelessWidget {
  const LocationSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          color: Colors.purpleAccent,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const CustomText(
          text: "Location",
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, bottom: 8),
            child: CustomText(
              text: "CURRENT LOCATION",
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.place, color: Colors.blue,),
                    SizedBox(width: 5,),
                    CustomText(
                      text: "My current location",
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    Spacer(),
                    Icon(Icons.check_outlined, color: Colors.lightBlueAccent,size: 35,)
                  ],
                ),
              ),
          Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Adjust button size
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // No border curves
                    ),
                    backgroundColor: Colors.purpleAccent,

                    // Text color
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.local_airport, color: Colors.white,size: 35,),
                      SizedBox(width: 10,),
                      CustomText(
                        text: "Add a new location",
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                      ),
                    ],
                  ),
                ),

              ),
        ],
      ),
    );
  }
}
