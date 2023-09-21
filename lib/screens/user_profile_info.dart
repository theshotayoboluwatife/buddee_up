import 'dart:ui';
import 'package:flutter/material.dart';
import '../custom_widgets/custom_text.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton:FloatingActionButton(
        onPressed: () {
    },
    child: Icon(Icons.message_sharp, color: Colors.white,),
    backgroundColor: Colors.purpleAccent,
        shape: CircleBorder(),
    ),
      body:  ListView(
            children: [
              Container(
                color: Colors.black,
                padding: EdgeInsets.only(left: 4, right: 4),
                child: Container(
                  child:
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                          width: double.infinity,
                          height: size.height * 0.45,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)
                            ),
                            child: Image.asset(
                              "assets/images/profile_info1.png",
                              fit: BoxFit.cover,
                              width: 60,
                              height: size.height * 0.8,
                            ),
                          )),
                      Positioned(
                        top: 5,
                      //page_indicator
                      child: Container(),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: IconButton(
                          icon: CircleAvatar(
                              minRadius: 20,
                              child: Icon(
                                Icons.person,
                                size: 20,
                              ),
                              backgroundColor:
                              Colors.purpleAccent,
                              foregroundColor:Colors.white),
                          onPressed: () {},
                        ),
                      ),
                      Positioned(
                          top: 0,
                          left: 24,
                          child: IconButton(
                            iconSize: 50,
                            icon: Icon(Icons.more_horiz, color: Colors.white,),
                            onPressed: (){},
                          )),


                    ],
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        children: [
                          CustomText(text: "Anabelle 19", fontWeight: FontWeight.bold, fontSize: 18,),
                          SizedBox(width: 5,),
                          Icon(Icons.verified, color: Colors.purple,)
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          CustomText(text: "2 hrs ago", fontSize: 12, fontWeight:FontWeight.w300,),
                          SizedBox(width: 2,),
                          Icon(Icons.circle, color: Colors.green, size: 10,),
                        ],
                      ),
                      SizedBox(height: 5,),
                      CustomText(text: "60mi away", fontSize: 12, fontWeight: FontWeight.w300,),
                      SizedBox(height: 16,),
                      CustomText(text: "ABOUT ME",fontSize: 15, fontWeight: FontWeight.w300,),
                      SizedBox(height: 14,),
                      CustomText(text: "Hey guys, This is Anabelle. I’m here to find someone for hookup. I’m not interested in something serious. I would love to hear your adventurous story.",
                        fontWeight: FontWeight.w300,fontSize: 12, ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Image.asset("assets/images/fa-solid_mask.png",width: 20,height: 20,),
                          SizedBox(width: 8,),
                          CustomText(text: "Top/Average", fontSize: 12, fontWeight: FontWeight.w300,)
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Image.asset("assets/images/ion_speedometer.png",width: 20,height: 20,),
                          SizedBox(width: 8,),
                          CustomText(text: "33yrs/5\'ft 0\"in", fontSize: 12, fontWeight: FontWeight.w300,)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Image.asset("assets/images/material-symbols_ecg-heart.png",width: 20,height: 20,),
                          SizedBox(width: 8,),
                          CustomText(text: "Married", fontSize: 12, fontWeight: FontWeight.w300,)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Image.asset("assets/images/multilang.png",width: 20,height: 20,),
                          SizedBox(width: 8,),
                          CustomText(text: "African-American/English", fontSize: 12, fontWeight: FontWeight.w300,)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.place, color: Colors.white,),
                          SizedBox(width: 8,),
                          CustomText(text: "United States", fontSize: 12, fontWeight: FontWeight.w300,)
                        ],
                      ),
                      SizedBox(height: 20,),
                      CustomText(text: 'LOOKING FOR', fontSize: 15, fontWeight: FontWeight.w300,),
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: CustomText(
                              text: "Hookup",
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff141416),
                            ),
                          ),
                        ),
                      ),
                      CustomText(text: 'ACTIVITIES', fontSize: 15, fontWeight: FontWeight.w300,),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: CustomText(
                                  text: "Coffee Talks/Drinks/Happy Hours",
                                  fontSize: 12,
                                  color: Colors.purple[300],
                                  fontWeight: FontWeight.w300,
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff141416),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: CustomText(
                                  text: "SPA",
                                  fontSize: 12,
                                  color: Colors.purple[300],
                                  fontWeight: FontWeight.w300,
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff141416),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: CustomText(
                                  text: "Fetishes/Groups",
                                  color: Colors.purple[300],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff141416),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: CustomText(
                                  text: "Cafe Hopping",
                                  fontSize: 12,
                                  color: Colors.purple[300],
                                  fontWeight: FontWeight.w300,
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff141416),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      CustomText(text: 'PRIVATE PHOTOS', fontSize: 15, fontWeight: FontWeight.w300,),
                      SizedBox(height: 16,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/prof1.png'
                                        ),
                                        fit: BoxFit.cover
                                    )
                                ),
                              ),
                              Positioned(
                                top: 0,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: ClipRRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2), // Adjust the sigma values for blur intensity
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      color: Colors.transparent, // Make the blurred container transparent
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Icon(Icons.lock, color: Colors.purple, size: 35,),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 20,),
                          Stack(children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/prof1.png'
                                      ),
                                      fit: BoxFit.cover
                                  )
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: BackdropFilter(
                                  filter:ImageFilter.blur(sigmaX: 10, sigmaY: 35),
                                  child: Container(
                                      color: Colors.transparent,
                                      child: Image.asset("assets/images/prof3.png",
                                        fit: BoxFit.cover,)
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: ClipRRect(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2), // Adjust the sigma values for blur intensity
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    color: Colors.transparent, // Make the blurred container transparent
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Icon(Icons.lock, color: Colors.purple, size: 35,),
                              ),
                            ),

                          ],),
                          SizedBox(width: 20,),
                          Stack(children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/prof3.png'
                                      ),
                                      fit: BoxFit.cover
                                  )
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: BackdropFilter(
                                  filter:ImageFilter.blur(sigmaX: 10, sigmaY: 35),
                                  child: Container(
                                      color: Colors.transparent,
                                      child: Image.asset("assets/images/prof2.png",
                                        fit: BoxFit.cover,)
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: ClipRRect(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2), // Adjust the sigma values for blur intensity
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    color: Colors.transparent, // Make the blurred container transparent
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Icon(Icons.lock, color: Colors.purple, size: 35,),
                              ),
                            ),
                          ],),
                        ],
                      ),
                      SizedBox(height: 32,),
                      Center(
                        child: Column(
                          children: [
                            CustomText(text: "SHARE ROMA'S PROFILE", fontWeight: FontWeight.w300,
                              fontSize: 12,),
                            SizedBox(height: 4,),
                            CustomText(text: "SEE WHAT A FRIEND THINKS", fontWeight: FontWeight.w300,
                              fontSize: 9,),
                            SizedBox(height: 40,),
                            CustomText(text: "REPORT ROMA", fontWeight: FontWeight.w300,
                              fontSize: 12,),
                            SizedBox(height: 30,),
                            IconButton(onPressed: (){}, icon: Icon(Icons.cancel_rounded, color: Colors.white,size: 50,)),
                            SizedBox(height: 30,),
                          ],
                        ),
                      )
                  ],),
              ),
            ]
          ),


    );
  }
}
