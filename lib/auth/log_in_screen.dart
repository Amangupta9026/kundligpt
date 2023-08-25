import 'dart:developer';

import 'package:kundligpt/widget/alertdialogbox.dart';

import '../utils/file_collection.dart';
import 'google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: rubyRed,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: backgroundColor,
            body: SingleChildScrollView(
                child: Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.28,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                width: double.infinity,
                decoration: const BoxDecoration(color: rubyRed),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Hello,',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      Text(isSelected ? 'Create an Account' : 'Welcome Back!',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Padding(
                          padding:
                              const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                          child: Center(
                              child: Text(
                                  isSelected
                                      ? 'Please enter your details to create your account'
                                      : 'Please enter your email and password details to access your account',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500))))
                    ]),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.25),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 60.0),
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: offlineButtonColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: offlineButtonColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isSelected = true;
                                  });
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                  decoration: BoxDecoration(
                                      color: isSelected
                                          ? rubyRed
                                          : offlineButtonColor,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Text('Sign Up',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: isSelected
                                              ? Colors.white
                                              : textColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isSelected = false;
                                  });
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? offlineButtonColor
                                        : rubyRed,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text('Sign in',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: isSelected
                                              ? textColor
                                              : Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      isSelected ? signUp(context) : signIn(context),
                    ]),
                  ),
                ),
              )
            ]))),
      ),
    );
  }

  Widget signUp(BuildContext context) {
    return Visibility(
        visible: isSelected == true ? true : false,
        child: Column(
          children: [
            const CustomTextFormField(
              //   controller: _fNameController,
              prefixIcon: Icon(Icons.person),
              labelText: 'Full Name:',
              hintText: 'Enter your name',
            ),
            const SizedBox(height: 20),
            const CustomTextFormField(
              //  controller: _phoneController,
              prefixIcon: Icon(Icons.phone_android_rounded),
              keyboardType: TextInputType.phone,
              labelText: 'Phone no:',
              hintText: 'Enter your phone no.',
            ),
            const SizedBox(height: 20),
            const CustomTextFormField(
              // controller: _emailController,
              prefixIcon: Icon(Icons.email_outlined),
              keyboardType: TextInputType.emailAddress,
              labelText: 'Email:',
              hintText: 'Enter your email',
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              //  controller: _fNameController,
              prefixIcon: const Icon(Icons.lock),
              labelText: 'Password:',
              hintText: 'Enter your password',
              suffixIcon: IconButton(
                  icon: const Icon(
                      color: rubyRed,
                      // refWatch.value!.isPasswordVisible
                      //     ?
                      Icons.visibility
                      //     : Icons.visibility_off,
                      ),
                  onPressed: () {}
                  // refRead.isPasswordVisible,
                  ),
            ),
            const SizedBox(
              height: 30,
            ),
            buttonWithIconSizedBox(rubyRed, Icons.verified_user, "Sign Up", () {
              // refRead.signIn(context, latitude.toString(),
              //     longitude.toString());
              context.pushNamed(RouteNames.otpScreen);
            }),
            const SizedBox(height: 20),
            const Text('Or Sign Up with',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(MdiIcons.google, color: Colors.red),
                const SizedBox(width: 10),
                const Text('Sign Up with Google',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500))
              ]),
            ),
          ],
        ));
  }

  Widget signIn(BuildContext context) {
    return Visibility(
        visible: isSelected == false ? true : false,
        child: Column(
          children: [
            const CustomTextFormField(
              //  controller: _fNameController,
              prefixIcon: Icon(Icons.person),
              labelText: 'Email Id:',
              hintText: 'Enter your email id',
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              //  controller: _fNameController,
              prefixIcon: const Icon(Icons.lock),
              labelText: 'Password:',
              hintText: 'Enter your password',
              suffixIcon: IconButton(
                  icon: const Icon(
                      color: rubyRed,
                      // refWatch.value!.isPasswordVisible
                      //     ?
                      Icons.visibility
                      //     : Icons.visibility_off,
                      ),
                  onPressed: () {}
                  // refRead.isPasswordVisible,
                  ),
            ),
            const SizedBox(height: 12),
            const Align(
                alignment: Alignment.topRight,
                child: Text('Forgot Password?',
                    style: TextStyle(
                        color: rubyRed,
                        fontSize: 16,
                        fontWeight: FontWeight.w500))),
            const SizedBox(height: 30),
            buttonWithIconSizedBox(
                rubyRed, Icons.verified_user, "Proceed Securly", () {
              // refRead.signIn(context, latitude.toString(),
              //     longitude.toString());
              log('Login button pressed');
            }),
            const SizedBox(height: 20),
            const Text('Or Sign in with',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                showMyDialog(
                    context,
                    '“Kundali GPT” Wants to use “google.com” to sign in',
                    'This allows the app to share information about you.',
                    () {
                      onTapGoogle(context);
                    },
                    istwobutton: true,
                    actiontap1: () {
                      context.pop();
                    });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(MdiIcons.google, color: Colors.red),
                  const SizedBox(width: 10),
                  const Text('Sign in with Google',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500))
                ]),
              ),
            ),
          ],
        ));
  }
}
