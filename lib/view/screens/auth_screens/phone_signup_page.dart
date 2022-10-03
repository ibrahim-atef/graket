import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graket/model/users_model/users_model.dart';
import 'package:graket/utilites/reusable_func.dart';
import 'package:graket/view/screens/auth_screens/phone_verify_page.dart';
import 'package:graket/view/screens/auth_screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:graket/view_model/api_helper/local/shared_preferences.dart';
import 'package:mac_address/mac_address.dart';
import '../../../utilites/app_colors.dart';
import '../../../utilites/app_constants.dart';
import '../../widgets/utils_widgets/SMSCodeDialog.dart';
import '../../widgets/utils_widgets/alert_dialog.dart';
import '../app_main_page.dart';
import 'email_signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart' as Auth;

class PhoneSignUpPage extends StatefulWidget {
  const PhoneSignUpPage({Key? key}) : super(key: key);

  @override
  State<PhoneSignUpPage> createState() => _PhoneSignUpPageState();
}

class _PhoneSignUpPageState extends State<PhoneSignUpPage> {
  bool _isChecked = false;
  bool _isPhoneError = false;

  bool _isCheckError = false;
  String _phoneError = '';
  bool _isNameError = false;
  String _nameError = '';

  Color signupColor = neutral3Color;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  Auth.FirebaseAuth auth = Auth.FirebaseAuth.instance;

  // DatabaseReference ref = FirebaseDatabase.instance.ref("/");
  // late DataSnapshot snapshot;
  // late DataSnapshot snapshotInfo;
  // late Map<String, dynamic> usersInfo;
  // List usersEmails = [];
  // List usersNums = [];
  // List usersIDs = [];

  bool isValidPhoneNumber(String em) {
    String p = r'^(?:[+0][1-9])?[0-9]{10,12}$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // readData();
  }

  final formKey = GlobalKey<FormState>();
  String _countryCode = "+20";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                      "Welcome to\nGrakeT Academy",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: neutral1Color),
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 10),
                    child: Text("Name",
                        style: TextStyle(fontSize: 15, color: neutral2Color)),
                  ),
                  // TextFormField(
                  //   validator: (value) {
                  //     if (value!.length == 0) {
                  //       return 'Please enter mobile number';
                  //     } else if (!RegExp(validationPhone).hasMatch(value)) {
                  //       return 'Please enter valid mobile number';
                  //     }
                  //     return null;
                  //   },
                  //   keyboardType: TextInputType.phone,
                  //   controller: phoneController,
                  //   decoration: InputDecoration(
                  //     filled: true,
                  //     contentPadding: const EdgeInsets.all(15),
                  //     fillColor: neutral4Color,
                  //     hintText: 'Your phone number with country code',
                  //     errorText: _isPhoneError ? _phoneError : null,
                  //     hintStyle: const TextStyle(color: neutral3Color),
                  //     enabledBorder: const UnderlineInputBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  //       borderSide: BorderSide(color: neutral4Color),
                  //     ),
                  //     focusedBorder: const OutlineInputBorder(
                  //       borderSide: BorderSide(color: neutral4Color),
                  //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  //     ),
                  //   ),
                  // ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    validator: (value) {
                      if (value!.length == 0) {
                        return 'Please enter name';
                      } else if (value.toString().length <= 2 ||
                          !RegExp(validationName).hasMatch(value)) {
                        return "Enter valid name";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                      contentPadding: const EdgeInsets.all(15),
                      fillColor: neutral4Color,
                      hintText: 'Your name',
                      errorText: _isNameError ? _nameError : null,
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
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Spacer(flex: 1),
                      Expanded(
                        flex: 2,
                        child: DropdownButtonFormField<String>(
                            isExpanded: true,
                            decoration: InputDecoration(
                                labelText: "",
                                labelStyle: TextStyle(
                                    fontSize: 8, color: Colors.transparent)),
                            value: _countryCode,
                            onChanged: (String? newValue) {
                              _countryCode = newValue ?? "+961";
                            },
                            items: [
                              DropdownMenuItem<String>(
                                value: "+961",
                                child: Text("+961"),
                              ),
                              DropdownMenuItem<String>(
                                value: "+20",
                                child: Text("+20"),
                              ),
                              DropdownMenuItem<String>(
                                value: "+1",
                                child: Text("+1"),
                              ),
                            ]),
                      ),
                      Expanded(
                        flex: 6,
                        child: TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration:
                              InputDecoration(labelText: "Phone Number"),
                          validator: (value) {
                            String pattern = r'(^(?:[+0]9)?[0-9]{8,12}$)';
                            RegExp regExp = new RegExp(pattern);

                            if (value!.isEmpty) {
                              return "Please enter your phone number";
                            }
                            if (!regExp.hasMatch(value)) {
                              return "Please enter a valid phone number";
                            }

                            return null;
                          },
                        ),
                      ),
                      Spacer(flex: 1),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Checkbox(
                        value: _isChecked,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3)),
                        checkColor: neutral5Color,
                        activeColor: primaryColor,
                        fillColor: _isCheckError
                            ? MaterialStateProperty.resolveWith<Color>(
                                (states) {
                                return errorColor;
                              })
                            : null,
                        onChanged: (value) {
                          setState(() {
                            FocusScope.of(context).unfocus();
                            _isChecked = value!;
                            signupColor =
                                _isChecked ? primaryColor : neutral3Color;
                            _isCheckError = false;
                          });
                        },
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('By signing up you agree to our',
                              style: TextStyle(
                                  color: neutral2Color, fontSize: 15)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                splashColor: noneColor,
                                focusColor: noneColor,
                                hoverColor: noneColor,
                                highlightColor: noneColor,
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  y();
                                },
                                child: const Text("terms of service ",
                                    style: TextStyle(
                                        fontSize: 15, color: primaryColor)),
                              ),
                              const Text('and ',
                                  style: TextStyle(
                                      color: neutral2Color, fontSize: 15)),
                              InkWell(
                                splashColor: noneColor,
                                focusColor: noneColor,
                                hoverColor: noneColor,
                                highlightColor: noneColor,
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  y();
                                },
                                child: const Text("privacy policy",
                                    style: TextStyle(
                                        fontSize: 15, color: primaryColor)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom != 0
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          primary: signupColor),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (_isChecked) {
                          onPressed(context);
                        } else {
                          ShowAlertDialog().showErrorDialog(
                              context, 'Signup Error', "pls check privacy");
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: size.width - 40,
                        height: 45,
                        child: const Text("Sign In",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                      )),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: noneColor,
                        focusColor: noneColor,
                        hoverColor: noneColor,
                        highlightColor: noneColor,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EmailSignUpPage()));
                        },
                        child: const Text("Sign up with Email",
                            style:
                                TextStyle(fontSize: 15, color: primaryColor)),
                      ),
                      const Text(' or  ',
                          style: TextStyle(color: neutral2Color, fontSize: 15)),
                      InkWell(
                        splashColor: noneColor,
                        focusColor: noneColor,
                        hoverColor: noneColor,
                        highlightColor: noneColor,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInPage()));
                        },
                        child: const Text("Login",
                            style:
                                TextStyle(fontSize: 15, color: primaryColor)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void onPressed(BuildContext context) {
    String phone = phoneController.text;
    String name = nameController.text;

    if (formKey.currentState!.validate()) {
      Auth.FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: _countryCode + phone,
        timeout: Duration(seconds: 120),
        verificationCompleted: (Auth.PhoneAuthCredential credential) {
          print("it's valid");
        },
        verificationFailed: (Auth.FirebaseAuthException e) {
          print("failed");

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.toString())));
        },
        codeSent: (String verificationId, int? resendToken) async {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (BuildContext context) {
                return SMSCodeDialog(
                    phoneNumber: _countryCode + phone,
                    resendToken: resendToken,
                    onSMSCodeEntered: (smsCode, dialogContext) async {
                      try {
                        Auth.PhoneAuthCredential credential =
                            Auth.PhoneAuthProvider.credential(
                                verificationId: verificationId,
                                smsCode: smsCode);
                        Auth.UserCredential userCre =
                            await auth.signInWithCredential(credential);
                        createUser(
                            name: nameController.text,
                            phone: userCre.user!.phoneNumber!,
                            uId: userCre.user!.uid);

                        Auth.User firebaseUser = userCre.user!;
                      } catch (e) {
                        print(e);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Wrong sms "
                                "code")));
                      }
                    });
              });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print("timeout");
        },
      );
    }
  }

  createUser({
    required String name,
    required String phone,
    required String uId,
  }) async {
    var ip = await GetMac.macAddress;

    UserModel model = UserModel(
      ip: ip,
      name: name,
      email: "email",
      uId: uId,
      phone: phone,
      image:
          'https://media.istockphoto.com/photos/blue-open-sea-environmenttravel-and-nature-concept-picture-id1147989465?k=20&m=1147989465&s=612x612&w=0&h=nVI1UKhyr2WPZ5-gnFB3Q7jjToru4lg_ubBFx-Jomq0=',
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      CacheHelper.saveData(key: uidKey, value: uId);
      navigateAndKill(context, AppMainPage());
      print("user added phone success");
    }).catchError((error) {
      print(error.toString() + '**************');
      print(
          "RegisterScreen().confirmPasswordController.text.toString()*************************************");
    });
  }
}
