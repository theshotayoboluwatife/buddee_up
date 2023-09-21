import 'package:flutter/material.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_text.dart';

class SexualPreferences  extends StatelessWidget {
  const SexualPreferences({Key? key}) : super(key: key);

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
                      child: CustomText(text: "Sexual\nPreferences", fontSize: 36, fontWeight: FontWeight.w600,),
                    ),
                  ]),
            ),
            const SizedBox(height: 60,),
            Padding(
              padding: const EdgeInsets.only(left:12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: "Select your sexual preference", fontSize: 16, fontWeight: FontWeight.w400,),
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
                            value: "Top",
                            items: const [
                              DropdownMenuItem(
                                value: "Top",
                                child: Text("Top"),
                              ),
                              DropdownMenuItem(
                                value: "Bottom",
                                child: Text("Bottom"),
                              ),
                              DropdownMenuItem(
                                value: "Verse",
                                child: Text("Verse"),
                              ),
                              DropdownMenuItem(
                                value: "Top/Verse",
                                child: Text("Top/Verse"),
                              ),
                              DropdownMenuItem(
                                value: "Bottom/Verse",
                                child: Text("Bottom/Verse"),
                              ),
                              DropdownMenuItem(
                                value: "Asexual",
                                child: Text("Asexual"),
                              ),
                              DropdownMenuItem(
                                value: "Bi",
                                child: Text("Bi"),
                              ),
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
            CustomButton(text: "CONTINUE", textColor: Colors.black, onpress: (){Navigator.pushNamed(context, "/enable_location_screen");}, width: double.infinity,buttonColor: Colors.white,),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
