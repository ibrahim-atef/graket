import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:graket/view/screens/auth_screens/phone_signup_page.dart';
import 'package:graket/view/screens/auth_screens/signin_page.dart';
import 'package:graket/view/widgets/utils_widgets/alert_dialog.dart';
import '../../../Routes/routing.gr.dart';
import '../../../utilites/app_colors.dart';
import '../../../utilites/reusable_func.dart';

class PhoneVerifyPage extends StatefulWidget {
  final String phoneNumber;

  const PhoneVerifyPage({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  State<PhoneVerifyPage> createState() => _PhoneVerifyPageState();
}

class _PhoneVerifyPageState extends State<PhoneVerifyPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Color doneColor = neutral3Color;
  String? verificationId;
  bool _onEditing = true;
  String _code = '';

  @override
  void initState() {
    phoneSignUp(phoneNumber: widget.phoneNumber);
    super.initState();
  }

  Future phoneSignUp({required String phoneNumber}) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {
            if (value.user != null) {
              String uid = "EmailAuthentication().user.uid";
              var database;
              bool isExist = database.isExist('users/$uid');
              database.setData(
                  'users/$uid', {'phone': widget.phoneNumber, 'verify': true});
              /*  Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          isExist ? Home(index: 0) : const InfoPage())); */
            } else {
              ShowAlertDialog().showErrorDialog(context, 'Signin Error', '');
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            // print('The provided phone number is not valid.');
          }
        },
        codeSent: (String vId, int? resendToken) async {
          setState(() {
            verificationId = vId;
          });
        },
        timeout: const Duration(seconds: 90),
        codeAutoRetrievalTimeout: (String vId) {
          setState(() {
            verificationId = vId;
          });
        },
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 100),
                const Center(
                    child: Text(
                  "Verify",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: neutral1Color),
                )),
                const SizedBox(height: 20),
                const Center(
                    child: Text(
                        'We sent you a code to verify\nyour phone number',
                        style: TextStyle(color: neutral2Color, fontSize: 15))),
                const SizedBox(height: 30),
                Center(
                  child: InkWell(
                    splashColor: noneColor,
                    focusColor: noneColor,
                    hoverColor: noneColor,
                    highlightColor: noneColor,
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PhoneSignUpPage()));
                    },
                    child: const Text("Edit your phone number",
                        style: TextStyle(fontSize: 16, color: primaryColor)),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: VerificationCode(
                    fullBorder: true,
                    fillColor: neutral4Color,
                    textStyle: const TextStyle(fontSize: 20),
                    keyboardType: TextInputType.number,
                    length: 6,
                    autofocus: false,
                    cursorColor: primaryColor,
                    digitsOnly: true,
                    itemSize: 40,
                    onCompleted: (String value) {
                      setState(() {
                        _code = value;
                        doneColor = primaryColor;
                      });
                    },
                    onEditing: (bool value) {
                      setState(() {
                        _onEditing = value;
                      });
                      if (!_onEditing) FocusScope.of(context).unfocus();
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                    child: Text('I didn’t receive a code!',
                        style: TextStyle(color: neutral1Color, fontSize: 13))),
                Center(
                  child: InkWell(
                    splashColor: noneColor,
                    focusColor: noneColor,
                    hoverColor: noneColor,
                    highlightColor: noneColor,
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhoneVerifyPage(
                                  phoneNumber: widget.phoneNumber)));
                    },
                    child: const Text("Re-send code",
                        style: TextStyle(fontSize: 13, color: primaryColor)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      //MediaQuery.of(context).viewInsets.bottom == 0 >> invisible
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom != 0
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      primary: doneColor),
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    try {
                      await FirebaseAuth.instance
                          .signInWithCredential(PhoneAuthProvider.credential(
                              verificationId: verificationId!, smsCode: _code))
                          .then((value) {
                        if (value.user != null) {
                          String uid = "EmailAuthentication().user.uid";
                          var database;
                          bool isExist = database.isExist('users/$uid');
                          database.setData('users/$uid',
                              {'phone': widget.phoneNumber, 'verify': true});
                       navigateAndKill(context,SignInPage());
                          /*   Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => isExist?Home(index: 0) : const InfoPage())); */
                        } else {
                          ShowAlertDialog().showErrorDialog(
                              context, 'Signin Error', value.toString());
                        }
                      });
                    } catch (e) {}
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: size.width - 40,
                    height: 45,
                    child: const Text("Done",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  )),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
