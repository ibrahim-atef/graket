import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:graket/utilites/reusable_func.dart';
import 'package:graket/view/screens/intro_screens/splash_page.dart';
 import 'package:shared_preferences/shared_preferences.dart';

import '../../../Routes/routing.gr.dart';
import '../../../utilites/app_colors.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  Color doneColor = primaryColor;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final birthController = TextEditingController();
  final regionController = TextEditingController();

  addPref(firstName, lastName, birth, region) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', firstName);
    await prefs.setString('lastName', lastName);
    await prefs.setString('birth', birth);
    await prefs.setString('region', region);
    await prefs.setString('state', 'ready');
    await prefs.setString('isLoggedIn', 'true');
  }



  isDate(String date) {
    String pattern =
        r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(date);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    birthController.dispose();
    regionController.dispose();
    super.dispose();
  }

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 100),
                const Text(
                  "One small step ...",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: neutral1Color),
                ),
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 15, bottom: 5),
                            child: Text("First name",
                                style: TextStyle(
                                    fontSize: 15, color: neutral2Color)),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            controller: firstNameController,
                            decoration: const InputDecoration(
                              filled: true,
                              contentPadding: EdgeInsets.all(15),
                              fillColor: neutral4Color,
                              hintText: 'First name',
                              hintStyle: TextStyle(color: neutral3Color),
                              enabledBorder: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: neutral4Color),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: neutral4Color),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 15, bottom: 5),
                            child: Text("Last name",
                                style: TextStyle(
                                    fontSize: 15, color: neutral2Color)),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            controller: lastNameController,
                            decoration: const InputDecoration(
                              filled: true,
                              contentPadding: EdgeInsets.all(15),
                              fillColor: neutral4Color,
                              hintText: 'Last name',
                              hintStyle: TextStyle(color: neutral3Color),
                              enabledBorder: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: neutral4Color),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: neutral4Color),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 5),
                  child: Text("Date of birth",
                      style: TextStyle(fontSize: 15, color: neutral2Color)),
                ),
                TextFormField(
                  keyboardType: TextInputType.datetime,
                  controller: birthController,
                  decoration: const InputDecoration(
                    filled: true,
                    contentPadding: EdgeInsets.all(15),
                    fillColor: neutral4Color,
                    hintText: 'DD/MM/YYYY',
                    hintStyle: TextStyle(color: neutral3Color),
                    prefixIcon: Icon(Icons.date_range, color: neutral1Color),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: neutral4Color),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: neutral4Color),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 5),
                  child: Text("Region",
                      style: TextStyle(fontSize: 15, color: neutral2Color)),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: regionController,
                  decoration: const InputDecoration(
                    filled: true,
                    contentPadding: EdgeInsets.all(15),
                    fillColor: neutral4Color,
                    hintText: 'Your country',
                    hintStyle: TextStyle(color: neutral3Color),
                    suffixIcon: Icon(
                      Icons.more_horiz,
                      color: neutral1Color,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: neutral4Color),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: neutral4Color),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
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
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (firstNameController.text.isNotEmpty &&
                        lastNameController.text.isNotEmpty &&
                        birthController.text.isNotEmpty &&
                        regionController.text.isNotEmpty &&
                        isDate(birthController.text)) {
                      addPref(firstNameController.text, lastNameController.text,
                          birthController.text, regionController.text);

                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              scrollable: true,
                              title:
                                  Image.asset('assets/images/infocorrect.png'),
                              content: Column(
                                children: const [
                                  Text('Good job!',
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: neutral1Color,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    'Thanks for joining us',
                                    style: TextStyle(
                                        fontSize: 15, color: neutral3Color),
                                  )
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              actionsPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              actions: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    onPressed: () {
                                     navigateAndKill(context,SplashPage());
                                      /*  Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Home(index: 0))); */
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: size.width - 40,
                                      height: 45,
                                      child: const Text("Continue learning",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15)),
                                    )),
                              ],
                              actionsAlignment: MainAxisAlignment.center,
                            );
                          });
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              scrollable: true,
                              title: Image.asset(
                                  'assets/images/infoincorrect.png'),
                              content: Column(
                                children: const [
                                  Text('Something wrong',
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: neutral1Color,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    'Check validate inputs',
                                    style: TextStyle(
                                        fontSize: 15, color: neutral3Color),
                                  )
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              actionsPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              actions: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      primary: semantic1Color,
                                    ),
                                    onPressed: () {},
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: size.width - 40,
                                      height: 45,
                                      child: const Text("Try Again",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15)),
                                    )),
                              ],
                              actionsAlignment: MainAxisAlignment.center,
                            );
                          });
                    }
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
