import 'package:BuddeeUp/custom_widgets/custom_button.dart';
import 'package:BuddeeUp/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.65,
            decoration: BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                )),
            child: SafeArea(
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "BUDDEEUP",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        Container(
                          child: Stack(
                            children: [
                              Positioned(
                                  child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white, // Border color
                                    width: 1.0, // Border width
                                  ),
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    "assets/images/annabelle.png",
                                    width: 220,
                                    height: 220,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )),
                              Positioned(
                                right: 0,
                                  top: 0,
                                  child: Container(
                                padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Color(0xff141416),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white, // Border color
                                      width: 1.0, // Border width
                                    ),
                                  ),
                                child: ClipOval(
                                  child: CustomText(text: "45%", fontWeight: FontWeight.bold, fontSize: 16,),
                                ),
                              ))
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "JohnSmith, 20",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(width: 2,),
                            Icon(Icons.verified, color: Colors.black,size: 24,)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 80.0, right: 80),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  CustomText(text: "1", fontWeight: FontWeight.bold, fontSize: 16,),
                                  CustomText(text: "Following", fontWeight: FontWeight.w300,)
                                ],
                              ),
                              CustomText(text: "|"),
                              Column(
                                children: [
                                  CustomText(text: "100", fontWeight: FontWeight.bold, fontSize: 16,),
                                  CustomText(text: "Followers", fontWeight: FontWeight.w300,)
                                ],
                              ),
                              CustomText(text: "|"),
                              Column(
                                children: [
                                  CustomText(text: "20k", fontWeight: FontWeight.bold, fontSize: 16,),
                                  CustomText(text: "Likes", fontWeight: FontWeight.w300,)
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 65,
                    left: 40,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child:IconButton(
                            icon: Icon(Icons.settings, size: 40,color: Colors.black,),
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(height: 5,),
                        CustomText(
                          text: "SETTINGS",
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),

                      ],
                    ),
                  ),
                  Positioned(
                    right: 40,
                    bottom: 65,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child:IconButton(
                            icon: Icon(Icons.verified, size: 40, color: Colors.black,),
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(height: 5,),
                        CustomText(
                          text: "PRO",
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),

                      ],
                    ),
                  ),
                  Positioned(
                    right: 160,
                    bottom: 40,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child:IconButton(
                            icon: Icon(Icons.edit, size: 40, color: Colors.black,),
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(height: 5,),
                        CustomText(
                          text: "EDIT PROFILE",
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              color: Colors.black,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      border: Border.all(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(8),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.add_circle,color: Colors.white, size: 35,),
                        SizedBox(width: 5,),
                        CustomText(text: "Make Your Buddeeup Proposition", fontWeight: FontWeight.w400,)
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  CustomText(text: "BUDDEEUP PRO", color: Colors.purpleAccent, fontWeight: FontWeight.bold,fontSize: 24,),
                  SizedBox(height: 8,),
                  CustomText(text: "Get free video calls duration", fontSize: 16, fontWeight: FontWeight.w400,),
                  SizedBox(height: 16,),
                  //replace with actual page indicator
                  Container(
                    padding: EdgeInsets.only(left: 100, right: 100),
                    child: Row(
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
                  SizedBox(height: 16,),
                  CustomButton(text: "LEARN MORE", onpress: (){}, buttonColor: Colors.purpleAccent, width: size.height*0.3),
                  SizedBox(height: 16,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
