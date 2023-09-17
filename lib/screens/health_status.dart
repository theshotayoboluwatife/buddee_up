import 'package:flutter/material.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_text.dart';

class HealthStatus extends StatelessWidget {
  const HealthStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_outlined),
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:24.0, left: 8),
                      child: CustomText(text: "Health/HIV\nStatus", fontSize: 36, fontWeight: FontWeight.w600,),
                    ),
                  ]),
            ),
            SizedBox(height: 60,),
            Padding(
              padding: EdgeInsets.only(left:12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: "Select your health/HIV status", fontSize: 16, fontWeight: FontWeight.w400,),
                  SizedBox(height: 10,),
                  DecoratedBox(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child:Padding(
                          padding: EdgeInsets.only(left:30, right:30),
                          child:
                          DropdownButton(
                            value: "Negative",
                            items: [
                              DropdownMenuItem(
                                child: Text("Negative"),
                                value: "Negative",
                              ),
                              DropdownMenuItem(
                                child: Text("Negative on Prep"),
                                value: "Negative on Prep",
                              ),
                              DropdownMenuItem(
                                child: Text("Poz"),
                                value: "Poz",
                              ),
                              DropdownMenuItem(
                                child: Text("Poz Undetected"),
                                value: "Poz Undetected",
                              ),
                              DropdownMenuItem(
                                child: Text("Condoms Only"),
                                value: "Condoms Only",
                              ),
                            ],
                            onChanged: (value){
                            },
                            icon: Padding(
                                padding: EdgeInsets.only(left:20),
                                child:Icon(Icons.keyboard_arrow_down_outlined,)
                            ),
                            iconEnabledColor: Colors.black,
                            style: TextStyle(  //te
                                color: Colors.black,
                                fontSize: 20
                            ),

                            dropdownColor: Colors.white,
                            underline: Container(),
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(10),
                          )
                      )
                  ),
                ],
              ) ,),

            Spacer(),
            CustomButton(text: "CONTINUE", textColor: Colors.black, onpress: (){Navigator.pushNamed(context, "/activities_screen");}, width: double.infinity,buttonColor: Colors.white,),
            SizedBox(height: 20,)
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(227, 127, 236, 0.96),
              Color.fromRGBO(196, 32, 210, 0.96),
              Color.fromRGBO(163, 11, 176, 0.96), // rgba(163.15, 11.02, 176.37, 0.96)
            ],
          ),
        ),
      ),
    );
  }}
