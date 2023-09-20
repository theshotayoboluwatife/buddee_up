import 'dart:ui';
import 'package:BuddeeUp/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CafeTalksOne extends StatefulWidget {
  const CafeTalksOne({Key? key}) : super(key: key);

  @override
  State<CafeTalksOne> createState() => _CafeTalksOneState();
}

class _CafeTalksOneState extends State<CafeTalksOne> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isBlurred = false;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          height: double.infinity,
          child: Stack(
            children: [
              Container(
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.purpleAccent,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        bottomLeft:
                            Radius.circular(40)), // Adjust the radius as needed
                  )),
              Positioned(
                top: 60,
                child: IconButton(
                    onPressed: () {},
                    iconSize: 35,
                    icon: Icon(
                      Icons.clear,
                      color: Colors.white,
                    )),
              ),
              Positioned(
                  top: 60,
                  left: size.width / 2.8,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.purpleAccent[100],
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(16),
                    child: CustomText(
                      text: "Cafe Talks",
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Positioned(
                  top: 150,
                  left: 30,
                  child: Container(
                      width: size.width * 0.85,
                      height: size.height * 0.75,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/cafetalksImage.png",
                          fit: BoxFit.cover,
                          width: 60,
                          height: size.height * 0.8,
                        ),
                      ))),
              Positioned(
                  top: 160,
                  left: 40,
                  child: IconButton(
                    icon: Icon(Icons.more_horiz, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        isBlurred = !isBlurred;
                      });
                    },
                    iconSize: 35,
                  )),
              Positioned(
                bottom: 35,
                left: 20,
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        CustomText(
                          text: "Rohini   22",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.verified,
                          color: Colors.purpleAccent,
                        )
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "10 miles away",
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                          Container(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: CustomText(
                                text: "Join now",
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple),
                            ),
                          )
                        ],
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.circle, color: Colors.green, size: 10),
                            SizedBox(
                              width: 2,
                            ),
                            CustomText(
                              text: "recently active",
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
              if (isBlurred)
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
                AnimatedOpacity(
                  opacity: isBlurred ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 300),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: size.height*0.45,),
                        Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () { },
                              child: CustomText(
                                text: "REPORT RACHEAL",
                                fontWeight: FontWeight.w400,
                                color: Colors.purpleAccent,

                              ),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.white,padding: EdgeInsets.all(22),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  )
                              ),
                            )),
                        SizedBox(height: 10,),
                        Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isBlurred = !isBlurred;
                                });
                              },
                              child: CustomText(
                                text: "CANCEL",
                                fontWeight: FontWeight.w400,
                                color: Colors.black,

                              ),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.white,padding: EdgeInsets.all(22),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  )
                              ),
                            )),
                      ],
                    ),
                  ),
                )

            ],
          ),
      ),
    );
  }
}
