import 'package:BuddeeUp/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  final String outlineText =
  '''
  # Welcome to BUDDEEUP
  Please follow these House Rules
  ## 1.Ensure Authenticity
  Your picture, age and bio should displayed should be truthful
   ## 2.Stay Protected
  Your picture, age and bio should displayed should be truthful
   ## 3.Be Respectful
  Your picture, age and bio should displayed should be truthful
   ## 4.Take  initiative
  Your picture, age and bio should displayed should be truthful
''';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.close), color: Colors.white, ),
                  SizedBox(width: (size.width/4) ,),
                  Image(image: AssetImage("assets/images/buddee_up_logo.png"), width:87, height: 87)
                ],
              ),
            ),
            SizedBox(height: 20,),
            MarkdownBody(
              data: outlineText,
              styleSheet: MarkdownStyleSheet(
                h1: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.w800),
                h2: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w800),
                p: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.w300),
            ),
            ),
            Spacer(),
            CustomButton(text: "I AGREE", textColor: Colors.black, onpress: (){ Navigator.pushNamed(context, "/profile_screen");}),
            SizedBox(height: 20,),
          ],
        )
        ,
        decoration: BoxDecoration(
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
      ),
    );
  }
}
