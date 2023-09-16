import 'package:BuddeeUp/providers/welcome_screen_provider.dart';
import 'package:BuddeeUp/screens/account_recovery.dart';
import 'package:BuddeeUp/screens/google_signin.dart';
import 'package:BuddeeUp/screens/login_signup.dart';
import 'package:BuddeeUp/screens/phone_verification.dart';
import 'package:BuddeeUp/screens/sigin_screen.dart';
import 'package:BuddeeUp/screens/signup_screen.dart';
import 'package:BuddeeUp/screens/welcome.dart';
import 'package:BuddeeUp/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: WelcomeText(),
      child: MaterialApp(
        title: "BuddeeUp",
        theme: CustomAppTheme.lightTheme,
        darkTheme: CustomAppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routes: {
          '/': (context) => PhoneVerification(),
          '/welcome': (context) => WelcomeScreen(),
          '/signin' : (context) => SignIn(),
          '/signup' : (context) => SignUp(),
          '/account_recovery' : (context) => AccountRecovery(),
          '/google_signin' : (context) => GoogleSignIn(),
        },
        initialRoute: '/',
      ),
    );
  }
}

