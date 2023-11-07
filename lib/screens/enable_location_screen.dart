import 'package:BuddeeUp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_text.dart';
import '../providers/location_provider.dart';

class EnableLocation extends StatelessWidget {
  const EnableLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(227, 127, 236, 0.96), // rgba(227.15, 126.78, 235.88, 0.96)
              Color.fromRGBO(196, 32, 210, 0.96), // rgba(196.07, 31.56, 210.37, 0.96)
              Color.fromRGBO(163, 11, 176, 0.96), // rgba(163.15, 11.02, 176.37, 0.96)
            ],
          ),
        ),
        child: Column(
          children: [
            SafeArea(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      iconSize: 40,
                      icon: const Icon(Icons.arrow_back_outlined),
                      color: Colors.white,
                    ))),
            const SizedBox(height: 30,),
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(child: Image.asset("assets/images/Ellipse3.png")),
                Positioned(
                  child: Image.asset("assets/images/Frame3.png"),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              text: "Enable Location",
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              text:
                  "You'll need to enable your location in order to use BUDDEEUP",
              fontSize: 15,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            CustomButton(
              text: "ALLOW LOCATION",
              onpress: () {
                locationProvider.requestLocationPermission(context);
              },
              textColor: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  text: "TELL ME MORE",
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
                IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_drop_down_outlined), color: Colors.white,
                iconSize: 30,)
              ],
            ),
            //Spacer()
          ],
        ),
      ),
    );
  }
}
