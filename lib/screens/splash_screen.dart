import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash-screen';

  final Widget screen;
  const SplashScreen({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FlutterSplashScreen.fadeIn(
      backgroundColor: Colors.white,
      onInit: () {
        debugPrint("On Init");
      },
      onEnd: () {
        debugPrint("On End");
      },
      childWidget: SizedBox(
        height: size.height,
        width: size.width,
        child: Image.asset(
          "assets/images/Splashbg.png",
          fit: BoxFit.cover,
        ),
      ),
      onAnimationEnd: () => debugPrint("On Fade In End"),
      nextScreen: screen,
    );
  }
}
