import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graket/view/screens/auth_screens/signin_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../utilites/app_colors.dart';
import '../../../utilites/app_constants.dart';
 import '../../widgets/utils_widgets/alert_dialog.dart';
import 'email_signup_page.dart';
import 'info_page.dart';

class ForgetPassPage extends StatefulWidget {
  const ForgetPassPage({Key? key}) : super(key: key);

  @override
  State<ForgetPassPage> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {
  Timer? timer;
  final emailController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  addPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('state', 'notInfo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 100),
                const Center(
                    child: Text(
                  "reset pass",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: neutral1Color),
                )),
                const SizedBox(height: 20),
                const Center(
                    child: Text(
                  'A email will be sent to your email.\nTry check spam inbox',
                  style: TextStyle(color: neutral2Color, fontSize: 15),
                  textAlign: TextAlign.center,
                )),
                const SizedBox(height: 50),
                TextFormField(
                  validator: (value) {
                    if (!RegExp(validationEmail).hasMatch(value!)) {
                      return "Invalid Email";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.all(15),
                    fillColor: neutral4Color,
                    hintText: 'Your email',
                    hintStyle: const TextStyle(color: neutral3Color),
                    enabledBorder: const UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: neutral4Color),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: neutral4Color),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                // Center(
                //   child: InkWell(
                //     splashColor: noneColor,
                //     focusColor: noneColor,
                //     hoverColor: noneColor,
                //     highlightColor: noneColor,
                //     onTap: () {
                //       Navigator.pushReplacement(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => const EmailSignUpPage()));
                //     },
                //     child: const Text("Edit your Email",
                //         style: TextStyle(fontSize: 16, color: primaryColor)),
                //   ),
                // ),
                const SizedBox(height: 30),
                const Center(
                    child: Text('I didn’t receive a code!',
                        style: TextStyle(color: neutral1Color, fontSize: 13))),
                Center(
                  child: InkWell(
                    splashColor: noneColor,
                    focusColor: noneColor,
                    hoverColor: noneColor,
                    highlightColor: noneColor,
                    onTap: () {},
                    child: const Text("Re-send",
                        style: TextStyle(fontSize: 13, color: primaryColor)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        primary: primaryColor),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (formKey.currentState!.validate()) {
                        setState(() {});
                        resetPassWord(emailController.text);
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width - 40,
                      height: 45,
                      child: const Text("Send",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void resetPassWord(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email).then((value) {
        ShowAlertDialog.showDoneDialog(
            context, "email sent", "Try check spam inbox", SignInPage());
      });
    } on FirebaseAuthException catch (error) {
      String title = error.code.toString().replaceAll(RegExp('-'), ' ');
      String message = "";
      if (error.code == 'user-not-found') {
        message =
            "Account does not exists for that $email.. Create your account by signing up..";
      } else {
        message = error.message.toString();
      }
      ShowAlertDialog().showErrorDialog(context, title, message);
    } catch (error) {
      ShowAlertDialog().showErrorDialog(context, "error", error.toString());

      print(error);
    }
  }
}
