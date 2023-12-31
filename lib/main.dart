import 'package:BuddeeUp/helpers/logger.dart';
import 'package:BuddeeUp/providers/create_new_user.dart';
import 'package:BuddeeUp/providers/location_provider.dart';
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
import 'package:BuddeeUp/screens/splash_screen.dart';
import 'package:BuddeeUp/screens/tribe.dart';
import 'package:BuddeeUp/screens/unsubscribe_mail.dart';
import 'package:BuddeeUp/screens/user_profile_info.dart';
import 'package:BuddeeUp/screens/username_settings.dart';
import 'package:BuddeeUp/screens/video_call.dart';
import 'package:BuddeeUp/screens/view_images.dart';
import 'package:BuddeeUp/screens/welcome.dart';
import 'package:BuddeeUp/themes/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

late final FirebaseAuth auth;
late final FirebaseApp app;
late final SharedPreferences prefs;
late bool isUserLoggedIn;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);
  prefs = await SharedPreferences.getInstance();

  isUserLoggedIn = prefs.getBool('isUserLoggedIn') ?? false;
  logger.i(isUserLoggedIn);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LocationProvider>(
          create: (context) => LocationProvider(),
        ),
        ChangeNotifierProvider<CreateNewUser>(
          create: (_) => CreateNewUser(),
        ),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BuddeeUp",
      theme: CustomAppTheme.customTheme,
      routes: {
        '/home': (context) => const LoginSignUp(),
        '/welcome': (context) => const WelcomeScreen(),
        '/signin': (context) => const SignIn(),
        '/signup': (context) => const SignUp(),
        '/home_screen': (context) => const HomeScreen(),
        '/account_recovery': (context) => AccountRecovery(),
        '/google_signin': (context) => const GoogleSignIn(),
        '/phone_verification': (context) => const PhoneVerification(),
        '/otp_verification': (context) => const OTPVerification(),
        '/profile_screen': (context) => ProfileScreen(),
        '/sex_type_screen': (context) => SexType(),
        '/tribe_screen': (context) => const Tribe(),
        '/body_type_screen': (context) => const BodyType(),
        '/ethnicity_screen': (context) => const Ethnicity(),
        '/looking_for_screen': (context) => const LookingFor(),
        "/relationship_status_screen": (context) => const RelationshipStatus(),
        "/health_status_screen": (context) => const HealthStatus(),
        "/activities_screen": (context) => const ActivitiesScreen(),
        "/sexual_preference_screen": (context) => const SexualPreferences(),
        "/enable_location_screen": (context) => const EnableLocation(),
        "/keep_me_posted_screen": (context) => const KeepMePosted(),
        "/report_user_screen": (context) => const ReportUserScreen(),
        "/phone_number_settings": (context) => PhoneNumberSettings(),
        "/connected_accounts": (context) => const ConnectedAccountScreen(),
        "/email_verification_settings": (context) =>
            const EmailVerificationSettings(),
        "/location_settings_screen": (context) => const LocationSettings(),
        "/show_me_screen": (context) => const ShowMeScreen(),
        "/blocked_contacts_screen": (context) => const BlockedContactsScreen(),
        "/add_contacts_screen": (context) => const AddContactsScreen(),
        "/read_receipts_settings": (context) => const ReadReceiptsSettings(),
        "/autoplay_videos_settings": (context) => const AutoplaySettings(),
        "/online_now_screen": (context) => const OnlineNowScreen(),
        "/recently_active_status": (context) => const RecentlyActiveStatus(),
        "/username_settings": (context) => const UsernameSettings(),
        "/push_notification_settings": (context) =>
            const PushNotificationSettings(),
        "/edit_info": (context) => const EditInfo(),
        "/email_unsubscribe": (context) => const EmailUnsubscribe(),
        "/cafe_talks_one": (context) => const CafeTalksOne(),
        "/user_profile_info": (context) => const UserProfileInfo(),
        "/view_image": (context) => const ViewImage(),
        "/video_call_screen": (context) => const VideoCallScreen(),
        "/voice_call_screen": (context) => const PhoneCallScreen(),
        "/user_profile": (context) => EditProfile(),
        "/go_pro_screen": (context) => GoPro(
              onTap: () => Navigator.pop(context),
            ),
        "/settings": (context) => const Settings(),
        "/proposition_screen": (context) => PropositionScreen(),
        "/unsubscribe_email_screen": (context) => const EmailUnsubscribe(),
        // SplashScreen.routeName:(context) => const SplashScreen(),
      },
      // initialRoute: isUserLoggedIn ? '/home_screen' : '/',
      home: SplashScreen(
        screen: isUserLoggedIn ? const HomeScreen() : const LoginSignUp(),
      ),
    );
  }
}
