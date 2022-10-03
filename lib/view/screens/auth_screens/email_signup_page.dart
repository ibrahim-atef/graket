import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graket/utilites/reusable_func.dart';
import 'package:graket/view/screens/app_main_page.dart';
import 'package:graket/view/screens/auth_screens/phone_signup_page.dart';
import 'package:graket/view/screens/auth_screens/signin_page.dart';
import 'package:graket/view/widgets/utils_widgets/alert_dialog.dart';
import 'package:graket/view_model/controller/auth_cubit/auth_cubit.dart';
import 'package:graket/view_model/controller/auth_cubit/auth_states.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utilites/app_colors.dart';
import '../../../utilites/app_constants.dart';
 Future<void> y() async {
  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
}  final Uri url = Uri.parse(
    'https://www.privacypolicies.com/live/6c425a85-48e6-4e84-a254-4a46b44a3858');
class EmailSignUpPage extends StatefulWidget {
  const EmailSignUpPage({Key? key}) : super(key: key);

  @override
  State<EmailSignUpPage> createState() => _EmailSignUpPageState();
}

class _EmailSignUpPageState extends State<EmailSignUpPage> {
  bool _isSecure = true;
  bool _isSecureCon = true;
  bool _isChecked = false;
  bool _isEmailError = false;
  bool _isNameError = false;  String _nameError = '';
  bool _isPassError = false;
  bool _isConfirmError = false;
  bool _isCheckError = false;
  String _emailError = '';

  String _passError = '';
  String _confirmError = '';
  Color signupColor = neutral3Color;



  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }





  bool isPassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  @override
  void dispose() {
    passController.dispose();
    emailController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  addPref(email, uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('type', 'Email');
    await prefs.setString('email', email);
    await prefs.setString('uid', uid);
    await prefs.setString('state', 'notVerified');
  }

  var formkey = GlobalKey<FormState>();

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
              key: formkey,
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
                  const Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 10),
                    child: Text("Email",
                        style: TextStyle(fontSize: 15, color: neutral2Color)),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (value) {
                      if (value!.length == 0) {
                        return 'Please enter email';
                      } else if (!RegExp(validationEmail).hasMatch(value)) {
                        return "Invalid Email";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                      contentPadding: const EdgeInsets.all(15),
                      fillColor: neutral4Color,
                      hintText: 'Your email',
                      errorText: _isEmailError ? _emailError : null,
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
                  const Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 10, top: 20),
                    child: Text("Password",
                        style: TextStyle(fontSize: 15, color: neutral2Color)),
                  ),
                  TextFormField(
                    obscureText: _isSecure,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passController,
                    validator: (value) {
                      if (value!.toString().length < 6) {
                        return "Password is too short";
                      } else if (!RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(value)) {
                        return "Password is too weak";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          padding: const EdgeInsets.all(0),
                          color: noneColor,
                          highlightColor: noneColor,
                          hoverColor: noneColor,
                          focusColor: noneColor,
                          splashColor: noneColor,
                          disabledColor: noneColor,
                          onPressed: () {
                            setState(() {
                              _isSecure = !_isSecure;
                            });
                          },
                          icon: _isSecure
                              ? const ImageIcon(
                                  AssetImage('assets/icons/hide_pass.png'),
                                  color: neutral3Color)
                              : const ImageIcon(
                                  AssetImage('assets/icons/show_pass.png'),
                                  color: neutral3Color)),
                      filled: true,
                      contentPadding: const EdgeInsets.all(15),
                      fillColor: neutral4Color,
                      errorText: _isPassError ? _passError : null,
                      hintText: 'Your password',
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
                  const Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 10, top: 20),
                    child: Text("Confirm password",
                        style: TextStyle(fontSize: 15, color: neutral2Color)),
                  ),
                  TextFormField(
                    obscureText: _isSecureCon,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!=passController.text||value!.isEmpty){
                        return "Password must be same";
                      }else{return null;}
                    },
                    controller: confirmPassController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          padding: const EdgeInsets.all(0),
                          color: noneColor,
                          highlightColor: noneColor,
                          hoverColor: noneColor,
                          focusColor: noneColor,
                          splashColor: noneColor,
                          disabledColor: noneColor,
                          onPressed: () {
                            setState(() {
                              _isSecureCon = !_isSecureCon;
                            });
                          },
                          icon: _isSecureCon
                              ? const ImageIcon(
                                  AssetImage('assets/icons/hide_pass.png'),
                                  color: neutral3Color)
                              : const ImageIcon(
                                  AssetImage('assets/icons/show_pass.png'),
                                  color: neutral3Color)),
                      filled: true,
                      contentPadding: const EdgeInsets.all(15),
                      fillColor: neutral4Color,
                      errorText: _isConfirmError ? _confirmError : null,
                      hintText: 'Your password',
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
                                onTap: () async {
                                  y();

                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const EmailSignUpPage()));
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
                                  y();

                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const EmailSignUpPage()));
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
      //MediaQuery.of(context).viewInsets.bottom == 0  >> invisible
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom != 0
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BlocProvider(
                    create: (BuildContext context) => AuthCubit(),
                    child: BlocConsumer<AuthCubit, AuthStates>(
                      listener: (BuildContext context, Object? state) {
                        if (state is SuccessCreateState) {
                          navigateTo(context, AppMainPage());
                        } else if (state is ErrorCreateState) {
                          ShowAlertDialog().showErrorDialog(
                              context, 'Signup Error', state.toString());
                        }
                      },
                      builder: (context, state) {
                        var authCubit = AuthCubit.get(context);
                        return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                primary: signupColor),
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              if (_isChecked) {
                                if (formkey.currentState!.validate()) {
                                  String name = nameController.text;

                                  String email = emailController.text.trim();
                                  String password = passController.text;

                                  authCubit.userRegister(
                                    name: name,
                                    email: email,
                                    password: password,
                                  );
                                }
                              } else {
                                ShowAlertDialog().showErrorDialog(context,
                                    'Signup Error', "pls check privacy");
                              }
                              /*
                        FocusScope.of(context).unfocus();
                        if (emailController.text.isNotEmpty &&
                            isEmail(emailController.text)&&nameController.text.isNotEmpty) {
                          setState(() {
                            _isEmailError = false;
                          });
                          if (passController.text.isNotEmpty &&
                              isPassword(passController.text)) {
                            setState(() {
                              _isPassError = false;
                            });
                            if (confirmPassController.text.isNotEmpty &&
                                confirmPassController.text ==
                                    passController.text) {
                              setState(() {
                                _isConfirmError = false;
                              });
                              if (_isChecked) {
                                setState(() {
                                  _isCheckError = false;
                                });
                                EmailAuthentication()
                                    .emailSignUp(
                                        email: emailController.text,
                                        password: passController.text)
                                    .then((value) async {
                                  if (value == null) {
                                    addUser(emailController.text,
                                        EmailAuthentication().user.uid);
                                    addPref(emailController.text,
                                        EmailAuthentication().user.uid);
                                    EmailAuthentication().userVerify();
                                    navigateAndKill(context, AppMainPage());
                                    /*  Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const EmailVerifyPage())); */
                                  } else {
                                    ShowAlertDialog().showErrorDialog(
                                        context, 'Signup Error', value);
                                  }
                                });
                              } else {
                                setState(() {
                                  _isCheckError = true;
                                });
                              }
                            } else {
                              setState(() {
                                _isConfirmError = true;
                                _confirmError =
                                    'Confirm Password is not correct';
                              });
                            }
                          } else {
                            setState(() {
                              _isPassError = true;
                              _passError = 'Password is not correct';
                            });
                          }
                        } else {
                          setState(() {
                            _isEmailError = true;
                            _isNameError=true;
                            _emailError = 'Invalid Email';
                            _nameError = 'Invalid Name';
                          });
                        }*/
                            },
                            child: state is LoadingRegisterState
                                ? Container(
                                    alignment: Alignment.center,
                                    width: size.width - 40,
                                    height: 45,
                                    child: const CircularProgressIndicator(
                                        color: Colors.white),
                                  )
                                : Container(
                                    alignment: Alignment.center,
                                    width: size.width - 40,
                                    height: 45,
                                    child: const Text("Sign up",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15)),
                                  ));
                      },
                    ),
                  ),
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
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PhoneSignUpPage()));
                        },
                        child: const Text("Sign in with Phone",
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
}
