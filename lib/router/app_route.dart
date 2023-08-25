import 'package:kundligpt/auth/log_in_screen.dart';
import 'package:kundligpt/auth/otp_screen.dart';
import 'package:kundligpt/auth/submit_personal_details_screen.dart';
import 'package:kundligpt/utils/file_collection.dart';

bool isUserLogin =
//Prefs.getBool(PrefNames.isLogin) ??
    false;

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  Offset? begin,
}) {
  return CustomTransitionPage<T>(
    fullscreenDialog: true,
    transitionDuration: const Duration(seconds: 1),
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
          alwaysIncludeSemantics: true, opacity: animation, child: child);

      // SlideTransition(
      //   position: Tween<Offset>(
      //     begin: const Offset(0, 1.0),
      //     end: Offset.fromDirection(0, 1.0),
      //   ).animate(animation),
      //   child: child,
      // );
    },
  );
}

String getInitialRoute() {
  switch (isUserLogin) {
    case false:
      return RouteNames.logInScreen;
    default:
      return RouteNames.logInScreen;
  }
}

final appRoute = GoRouter(initialLocation: getInitialRoute(), routes: [
  // GoRoute(
  //   path: RouteNames.onBoarding,
  //   name: RouteNames.onBoarding,
  //   builder: (context, state) {
  //     return const OnBoarding();
  //   },
  // ),

  GoRoute(
      path: RouteNames.logInScreen,
      name: RouteNames.logInScreen,
      builder: (context, state) {
        return const LoginScreen();
      }),

  GoRoute(
      path: RouteNames.otpScreen,
      name: RouteNames.otpScreen,
      builder: (context, state) {
        return const OtpVerificationScreen();
      }),

  GoRoute(
      path: RouteNames.submitPersonalDetailsScreen,
      name: RouteNames.submitPersonalDetailsScreen,
      builder: (context, state) {
        return const SubmitPersonalDetailsScreen();
      }),

  
  // GoRoute(
  //     path: RouteNames.home,
  //     name: RouteNames.home,
  //     builder: (context, state) {
  //       return HomePage();
  //     }),

  // GoRoute(
  //     path: RouteNames.mainScreen,
  //     name: RouteNames.mainScreen,
  //     builder: (context, state) {
  //       return const MainScreen();
  //     }),

  // GoRoute(
  //   path: RouteNames.profile,
  //   name: RouteNames.profile,
  //   builder: (context, state) {
  //     return const ProfileScreen();
  //   },
  // ),

  // GoRoute(
  //   path: RouteNames.settingScreen,
  //   name: RouteNames.settingScreen,
  //   builder: (context, state) {
  //     return const Setting();
  //   },
  // ),

  // GoRoute(
  //   path: RouteNames.notification,
  //   name: RouteNames.notification,
  //   builder: (context, state) {
  //     return const NotificationScreen();
  //   },
  // ),

  // GoRoute(
  //   path: RouteNames.helpSupport,
  //   name: RouteNames.helpSupport,
  //   builder: (context, state) {
  //     return const HelpSupport();
  //   },
  // ),

  // GoRoute(
  //   path: RouteNames.userLocationNotPremises,
  //   name: RouteNames.userLocationNotPremises,
  //   builder: (context, state) {
  //     CommonApiResponseModel commonApiResponseModel =
  //         state.extra as CommonApiResponseModel;
  //     return UserLocationNotPremises(
  //       response: commonApiResponseModel,
  //     );
  //   },
  // ),

  // GoRoute(
  //   path: '/otpScreen/:mobileNumber/:verificationId/:resendToken',
  //   name: RouteNames.otpScreen,
  //   builder: (context, state) {
  //     return OTPScreen(
  //         mobileNumber: state.pathParameters['mobileNumber'] ?? '',
  //         verificationId: state.pathParameters['verificationId'] ?? '',
  //         resendToken: state.pathParameters['resendToken']);
  //   },
  // ),
]);
