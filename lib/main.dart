import 'package:BuddeeUp/providers/status_provider.dart';
import 'package:BuddeeUp/screens/account_recovery.dart';
import 'package:BuddeeUp/screens/activities_screen.dart';
import 'package:BuddeeUp/screens/add_contacts_screen.dart';
import 'package:BuddeeUp/screens/autoplay_settings.dart';
import 'package:BuddeeUp/screens/blocked_accounts.dart';
import 'package:BuddeeUp/screens/body_type.dart';
import 'package:BuddeeUp/screens/connected_account_screen.dart';
import 'package:BuddeeUp/screens/discover.dart';
import 'package:BuddeeUp/screens/email_verification_settings.dart';
import 'package:BuddeeUp/screens/enable_location_screen.dart';
import 'package:BuddeeUp/screens/ethnicity.dart';
import 'package:BuddeeUp/screens/google_signin.dart';
import 'package:BuddeeUp/screens/health_status.dart';
import 'package:BuddeeUp/screens/keep_me_posted_screen.dart';
import 'package:BuddeeUp/screens/location_settings_screen.dart';
import 'package:BuddeeUp/screens/login_signup.dart';
import 'package:BuddeeUp/screens/looking_for.dart';
import 'package:BuddeeUp/screens/online_now_screen.dart';
import 'package:BuddeeUp/screens/otp_verification.dart';
import 'package:BuddeeUp/screens/phone_number_settings.dart';
import 'package:BuddeeUp/screens/phone_verification.dart';
import 'package:BuddeeUp/screens/profile_screen.dart';
import 'package:BuddeeUp/screens/push_notifications_settings.dart';
import 'package:BuddeeUp/screens/read_receipts.dart';
import 'package:BuddeeUp/screens/recently_active_status.dart';
import 'package:BuddeeUp/screens/relationship_status.dart';
import 'package:BuddeeUp/screens/report_user_settings_screen.dart';
import 'package:BuddeeUp/screens/sex_type.dart';
import 'package:BuddeeUp/screens/sexual_preferences.dart';
import 'package:BuddeeUp/screens/show_me_screen.dart';
import 'package:BuddeeUp/screens/sigin_screen.dart';
import 'package:BuddeeUp/screens/signup_screen.dart';
import 'package:BuddeeUp/screens/tribe.dart';
import 'package:BuddeeUp/screens/username_settings.dart';
import 'package:BuddeeUp/screens/welcome.dart';
import 'package:BuddeeUp/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    MultiProvider(
        providers: [
          Provider(create: (_) => Status(),
          )
        ],
        child: const App()));

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Status(),
      child: MaterialApp(
        title: "BuddeeUp",
        theme: CustomAppTheme.lightTheme,
        routes: {
          '/': (context) => LoginSignUp(),
          '/welcome': (context) => WelcomeScreen(),
          '/signin': (context) => SignIn(),
          '/signup': (context) => SignUp(),
          '/discover_screen': (context) => DiscoverPage(),
          '/account_recovery': (context) => AccountRecovery(),
          '/google_signin': (context) => GoogleSignIn(),
          '/phone_verification': (context) => PhoneVerification(),
          '/otp_verification': (context) => OTPVerification(),
          '/profile_screen': (context) => ProfileScreen(),
          '/sex_type_screen': (context) => SexType(),
          '/tribe_screen': (context) => Tribe(),
          '/body_type_screen': (context) => BodyType(),
          '/ethnicity_screen': (context) => Ethnicity(),
          '/looking_for_screen': (context) => LookingFor(),
          "/relationship_status_screen": (context) => RelationshipStatus(),
          "/health_status_screen": (context) => HealthStatus(),
          "/activities_screen": (context) => ActivitiesScreen(),
          "/sexual_preference_screen": (context) => SexualPreferences(),
          "/enable_location_screen": (context) => EnableLocation(),
          "/keep_me_posted_screen": (context) => KeepMePosted(),
          "/report_user_screen": (context) => ReportUserScreen(),
          "/phone_number_settings": (context) => PhoneNumberSettings(),
          "/connected_accounts": (context) => ConnectedAccountScreen(),
          "/email_verification_settings": (context) => EmailVerificationSettings(),
          "/location_settings_screen": (context) => LocationSettings(),
          "/show_me_screen": (context) =>ShowMeScreen(),
          "/blocked_contacts_screen": (context) =>BlockedContactsScreen(),
          "/add_contacts_screen": (context) =>AddContactsScreen(),
          "/read_receipts_settings": (context) =>ReadReceiptsSettings(),
          "/autoplay_videos_settings": (context) =>AutoplaySettings(),
          "/online_now_screen": (context) =>OnlineNowScreen(),
          "/recently_active_status": (context) =>RecentlyActiveStatus(),
          "/username_settings": (context) =>UsernameSettings(),
          "/push_notification_settings": (context) =>PushNotificationSettings(),
        },
        initialRoute: '/',
      ),
    );
  }
}
