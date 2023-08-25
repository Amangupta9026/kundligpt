import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../utils/file_collection.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: rubyRed,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: backgroundColor,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: textColor,
              ),
              onPressed: () {
                context.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verify OTP',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  // controller: mobileOtpController!,
                  prefixIcon: Icon(MdiIcons.phoneCheckOutline),
                  keyboardType: TextInputType.number,
                  labelText: 'Verify your phone no :',
                  hintText: 'Enter your otp',
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  // controller: emailOtpController!,
                  prefixIcon: Icon(MdiIcons.emailCheckOutline),
                  keyboardType: TextInputType.number,
                  labelText: 'Verify your email :',
                  hintText: 'Enter your email otp',
                ),
                const SizedBox(height: 40),
                buttonWithIconSizedBox(
                    rubyRed, Icons.verified_user, "Submit OTP", () {
                  // refRead.signIn(context, latitude.toString(),
                  //     longitude.toString());
                  context.pushReplacementNamed(
                      RouteNames.submitPersonalDetailsScreen);
                }),
                const SizedBox(height: 40),
                buttonWithIconSizedBox(rubyRed, Icons.verified_user, "Logout",
                    () async {
                  // refRead.signIn(context, latitude.toString(),
                  //     longitude.toString());
                  await GoogleSignIn().signOut();
                  await FirebaseAuth.instance.signOut();
                  log('logout');
                  if (context.mounted) {
                    context.pushReplacementNamed(RouteNames.logInScreen);
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
