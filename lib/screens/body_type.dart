import 'package:flutter/material.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_text.dart';

class BodyType extends StatefulWidget {
  const BodyType({Key? key}) : super(key: key);

  @override
  State<BodyType> createState() => _BodyTypeState();
}

class _BodyTypeState extends State<BodyType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
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
                      icon: const Icon(Icons.arrow_back_outlined),
                      color: Colors.white,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top:24.0, left: 8),
                      child: CustomText(text: "Body Type", fontSize: 36, fontWeight: FontWeight.w600,),
                    ),
                  ]),
            ),
            const SizedBox(height: 60,),
            Padding(
              padding: const EdgeInsets.only(left:12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: "Select body type", fontSize: 16, fontWeight: FontWeight.w400,),
                  const SizedBox(height: 10,),
                  DecoratedBox(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child:Padding(
                          padding: const EdgeInsets.only(left:30, right:30),
                          child:
                          DropdownButton(
                            value: "Avg",
                            items: const [
                              DropdownMenuItem(
                                value: "Avg",
                                child: Text("Avg"),
                              ),
                              DropdownMenuItem(
                                value: "Fit",
                                child: Text("Fit"),
                              ),
                              DropdownMenuItem(
                                  value: "Chub",
                                  child: Text("Chub")
                              ),
                              DropdownMenuItem(
                                value: "Twink",
                                child: Text("Twink"),
                              ),
                              DropdownMenuItem(
                                value: "Bodybuilder",
                                child: Text("Bodybuilder"),
                              ),
                              DropdownMenuItem(
                                value: "Swimmer",
                                child: Text("Swimmer"),
                              )
                            ],
                            onChanged: (value){
                            },
                            icon: const Padding(
                                padding: EdgeInsets.only(left:20),
                                child:Icon(Icons.keyboard_arrow_down_outlined,)
                            ),
                            iconEnabledColor: Colors.black,
                            style: const TextStyle(  //te
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

            const Spacer(),
            CustomButton(text: "CONTINUE", textColor: Colors.black, onpress: (){Navigator.pushNamed(context, "/ethnicity_screen");}, width: double.infinity,buttonColor: Colors.white,),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
