import 'package:BuddeeUp/providers/location_provider.dart';
import 'package:BuddeeUp/providers/status_provider.dart';
import 'package:BuddeeUp/screens/account_recovery.dart';
import 'package:BuddeeUp/screens/activities_screen.dart';
import 'package:BuddeeUp/screens/add_contacts_screen.dart';
import 'package:BuddeeUp/screens/autoplay_settings.dart';
import 'package:BuddeeUp/screens/blocked_accounts.dart';
import 'package:BuddeeUp/screens/body_type.dart';
import 'package:BuddeeUp/screens/cafe_talks_one.dart';
import 'package:BuddeeUp/screens/connected_account_screen.dart';
import 'package:BuddeeUp/screens/edit_info.dart';
import 'package:BuddeeUp/screens/edit_profile.dart';
import 'package:BuddeeUp/screens/email_verification_settings.dart';
import 'package:BuddeeUp/screens/enable_location_screen.dart';
import 'package:BuddeeUp/screens/ethnicity.dart';
import 'package:BuddeeUp/screens/go_buddee_pro.dart';
import 'package:BuddeeUp/screens/google_signin.dart';
import 'package:BuddeeUp/screens/health_status.dart';
import 'package:BuddeeUp/screens/home_screen.dart';
import 'package:BuddeeUp/screens/keep_me_posted_screen.dart';
import 'package:BuddeeUp/screens/location_settings_screen.dart';
import 'package:BuddeeUp/screens/login_signup.dart';
import 'package:BuddeeUp/screens/looking_for.dart';
import 'package:BuddeeUp/screens/online_now_screen.dart';
import 'package:BuddeeUp/screens/otp_verification.dart';
import 'package:BuddeeUp/screens/phone_call.dart';
import 'package:BuddeeUp/screens/phone_number_settings.dart';
import 'package:BuddeeUp/screens/phone_verification.dart';
import 'package:BuddeeUp/screens/profile_screen.dart';
import 'package:BuddeeUp/screens/proposition_screen.dart';
import 'package:BuddeeUp/screens/push_notifications_settings.dart';
import 'package:BuddeeUp/screens/read_receipts.dart';
import 'package:BuddeeUp/screens/recently_active_status.dart';
import 'package:BuddeeUp/screens/relationship_status.dart';
import 'package:BuddeeUp/screens/report_user_settings_screen.dart';
import 'package:BuddeeUp/screens/settings.dart';
import 'package:BuddeeUp/screens/sex_type.dart';
import 'package:BuddeeUp/screens/sexual_preferences.dart';
import 'package:BuddeeUp/screens/show_me_screen.dart';
import 'package:BuddeeUp/screens/sigin_screen.dart';
import 'package:BuddeeUp/screens/signup_screen.dart';
import 'package:BuddeeUp/screens/tribe.dart';
import 'package:BuddeeUp/screens/unsubscribe_mail.dart';
import 'package:BuddeeUp/screens/user_profile_info.dart';
import 'package:BuddeeUp/screens/username_settings.dart';
import 'package:BuddeeUp/screens/video_call.dart';
import 'package:BuddeeUp/screens/view_images.dart';
import 'package:BuddeeUp/screens/welcome.dart';
import 'package:BuddeeUp/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    Provider(
      create: (_) => Status(),
    ),
    ChangeNotifierProvider<LocationProvider>(
      create: (context) => LocationProvider(),
    )
  ], child: const App()));
}

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
          '/': (context) => const LoginSignUp(),
          '/welcome': (context) => const WelcomeScreen(),
          '/signin': (context) => const SignIn(),
          '/signup': (context) => const SignUp(),
          '/home_screen': (context) => const HomeScreen(),
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
          "/show_me_screen": (context) => ShowMeScreen(),
          "/blocked_contacts_screen": (context) => BlockedContactsScreen(),
          "/add_contacts_screen": (context) => AddContactsScreen(),
          "/read_receipts_settings": (context) => ReadReceiptsSettings(),
          "/autoplay_videos_settings": (context) => AutoplaySettings(),
          "/online_now_screen": (context) => OnlineNowScreen(),
          "/recently_active_status": (context) => RecentlyActiveStatus(),
          "/username_settings": (context) => UsernameSettings(),
          "/push_notification_settings": (context) => PushNotificationSettings(),
          "/edit_info": (context) => EditInfo(),
          "/email_unsubscribe": (context) => EmailUnsubscribe(),
          "/cafe_talks_one": (context) => CafeTalksOne(),
          "/user_profile_info": (context) => UserProfileInfo(),
          "/view_image": (context) => ViewImage(),
          "/video_call_screen": (context) => VideoCallScreen(),
          "/voice_call_screen": (context) => PhoneCallScreen(),
          "/user_profile": (context) => EditProfile(),
          "/go_pro_screen": (context) => GoPro(
                onTap: () => Navigator.pop(context),
              ),
          "/settings": (context) => Settings(),
          "/proposition_screen": (context) => PropositionScreen(),
          "/unsubscribe_email_screen": (context) => EmailUnsubscribe(),
        },
        initialRoute: '/',
      ),
    );
  }
}
