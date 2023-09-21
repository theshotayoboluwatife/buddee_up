import 'package:flutter/material.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_text.dart';

class Tribe extends StatefulWidget {
  const Tribe({Key? key}) : super(key: key);

  @override
  State<Tribe> createState() => _TribeState();
}

class _TribeState extends State<Tribe> {
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
                      child: CustomText(text: "Tribe", fontSize: 36, fontWeight: FontWeight.w600,),
                    ),
                  ]),
            ),
            const SizedBox(height: 60,),
            Padding(
              padding: const EdgeInsets.only(left:12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: "Select Tribe", fontSize: 16, fontWeight: FontWeight.w400,),
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
                            value: "Clean cut",
                            items: const [
                              DropdownMenuItem(
                                value: "Scruffy",
                                child: Text("Scruffy"),
                              ),
                              DropdownMenuItem(
                                value: "Clean cut",
                                child: Text("Clean cut"),
                              ),
                              DropdownMenuItem(
                                  value: "Metro",
                                  child: Text("Metro")
                              ),
                              DropdownMenuItem(
                                value: "Casual",
                                child: Text("Casual"),
                              ),
                              DropdownMenuItem(
                                value: "Grunge",
                                child: Text("Grunge"),
                              ),
                              DropdownMenuItem(
                                value: "Cowboy",
                                child: Text("Cowboy"),
                              ),
                              DropdownMenuItem(
                                value: "Geek",
                                child: Text("Geek"),
                              ),
                              DropdownMenuItem(
                                value: "Gamer",
                                child: Text("Gamer"),
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
            CustomButton(text: "CONTINUE", textColor: Colors.black, onpress: (){Navigator.pushNamed(context, "/body_type_screen");}, width: double.infinity,buttonColor: Colors.white,),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
