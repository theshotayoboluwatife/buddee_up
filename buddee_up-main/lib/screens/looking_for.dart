import 'package:flutter/material.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_text.dart';

class LookingFor extends StatefulWidget {
  const LookingFor({Key? key}) : super(key: key);

  @override
  State<LookingFor> createState() => _LookingForState();
}

class _LookingForState extends State<LookingFor> {
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_outlined),
                      color: Colors.white,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top:24.0, left: 8),
                      child: CustomText(text: "Looking For", fontSize: 36, fontWeight: FontWeight.w600,),
                    ),
                  ]),
            ),
            const SizedBox(height: 60,),
            Padding(
              padding: const EdgeInsets.only(left:12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: "Select what you are looking for", fontSize: 16, fontWeight: FontWeight.w400,),
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
                            value: "1-on-1 Now Only",
                            items: const [
                              DropdownMenuItem(
                                value: "1-on-1 Now Only",
                                child: Text("1-on-1 Now Only"),
                              ),
                              DropdownMenuItem(
                                value: "Relationship",
                                child: Text("Relationship"),
                              ),
                              DropdownMenuItem(
                                  value: "FWB/Casual",
                                  child: Text("FWB/Casual")
                              ),
                              DropdownMenuItem(
                                value: "Hang,Vibe, then maybe",
                                child: Text("Hang,Vibe, then maybe"),
                              ),
                              DropdownMenuItem(
                                value: "Platonic",
                                child: Text("Platonic"),
                              ),
                              DropdownMenuItem(
                                value: "Couples Platonic",
                                child: Text("Couples Platonic"),
                              ),
                              DropdownMenuItem(
                                value: "Couples FWB",
                                child: Text("Couples FWB"),
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
            CustomButton(text: "CONTINUE", textColor: Colors.black, onpress: (){Navigator.pushNamed(context, "/relationship_status_screen");}, width: double.infinity,buttonColor: Colors.white,),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
