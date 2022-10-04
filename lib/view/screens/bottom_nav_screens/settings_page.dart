import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graket/view/screens/auth_screens/signin_page.dart';
import 'package:graket/view_model/api_helper/local/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utilites/app_colors.dart';

import 'package:flutter/material.dart';

import '../../../utilites/app_constants.dart';
import '../../../utilites/reusable_func.dart';
import '../../widgets/utils_widgets/alert_dialog.dart';
import '../auth_screens/email_signup_page.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  setLoggedOut(c) async {
    await FirebaseAuth.instance.signOut();
    CacheHelper.clearData().then((value) => navigateAndKill(c, SignInPage()));
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: neutral5Color,
        //centerTitle: true,
        // leading: IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.menu),
        //     color: neutral1Color),
        title: const Text(
          'Settings',
          style: TextStyle(
              fontSize: 20, color: neutral1Color, fontWeight: FontWeight.w500),
        ),
        actions: [
          // IconButton(
          //     onPressed: () {},
          //     icon: const Icon(Icons.search),
          //     color: neutral1Color),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Account',
                  style: TextStyle(
                      fontSize: 20,
                      color: neutral1Color,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  leading: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.edit_calendar_outlined,
                        color: neutral1Color),
                  ),
                  title: const Text('Change Password',
                      style: TextStyle(
                          fontSize: 15,
                          color: neutral1Color,
                          fontWeight: FontWeight.w400)),
                  subtitle: const Text('Change your current password',
                      style: TextStyle(fontSize: 13, color: neutral3Color)),
                  trailing:
                      const Icon(Icons.arrow_forward_ios, color: neutral1Color),
                  horizontalTitleGap: 10,
                  onTap: () {
                    auth.currentUser!.email!.isNotEmpty
                        ? resetPassWord(auth.currentUser!.email!, context)
                        : null;
                  },
                ),
              ),
              const SizedBox(height: 5),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  leading: const Padding(
                    padding: EdgeInsets.all(10),
                    child:
                        Icon(Icons.privacy_tip_outlined, color: neutral1Color),
                  ),
                  title: const Text('Privacy Policy',
                      style: TextStyle(
                          fontSize: 15,
                          color: neutral1Color,
                          fontWeight: FontWeight.w400)),
                  subtitle: const Text('Ours privacy policy',
                      style: TextStyle(fontSize: 13, color: neutral3Color)),
                  trailing:
                      const Icon(Icons.arrow_forward_ios, color: neutral1Color),
                  horizontalTitleGap: 10,
                  onTap: () {
                    y();
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text('Preferences',
                  style: TextStyle(
                      fontSize: 20,
                      color: neutral1Color,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),

              /// may be used later
              // Card(
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(10)),
              //   child: ListTile(
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10)),
              //     leading: const Padding(
              //       padding: EdgeInsets.all(10),
              //       child:
              //           Icon(Icons.location_on_outlined, color: neutral1Color),
              //     ),
              //     title: const Text('Country',
              //         style: TextStyle(
              //             fontSize: 15,
              //             color: neutral1Color,
              //             fontWeight: FontWeight.w400)),
              //     subtitle: const Text('Change your current country',
              //         style: TextStyle(fontSize: 13, color: neutral3Color)),
              //     trailing:
              //         const Icon(Icons.arrow_forward_ios, color: neutral1Color),
              //     horizontalTitleGap: 10,
              //     onTap: () {},
              //   ),
              // ),
              _buildCountryPickerDropdownSoloExpanded(context),
              const SizedBox(height: 5),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  leading: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.language_outlined, color: neutral1Color),
                  ),
                  title: const Text('Language',
                      style: TextStyle(
                          fontSize: 15,
                          color: neutral1Color,
                          fontWeight: FontWeight.w400)),
                  subtitle: const Text('Change your primary language',
                      style: TextStyle(fontSize: 13, color: neutral3Color)),
                  trailing:
                      const Icon(Icons.arrow_forward_ios, color: neutral1Color),
                  horizontalTitleGap: 10,
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 5),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  leading: const Padding(
                    padding: EdgeInsets.all(10),
                    child:
                        Icon(Icons.info_outline, color: neutral1Color),
                  ),
                  title: const Text('contact us',
                      style: TextStyle(
                          fontSize: 15,
                          color: neutral1Color,
                          fontWeight: FontWeight.w400)),
                  subtitle: const Text('Contact the support team',
                      style: TextStyle(fontSize: 13, color: neutral3Color)),
                  trailing:
                      const Icon(Icons.arrow_forward_ios, color: neutral1Color),
                  horizontalTitleGap: 10,
                  onTap: () {x();},
                ),
              ),
              const SizedBox(height: 5),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  leading: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.logout_outlined, color: semantic1Color),
                  ),
                  title: const Text('Log out',
                      style: TextStyle(
                          fontSize: 15,
                          color: semantic1Color,
                          fontWeight: FontWeight.w400)),
                  subtitle: const Text('Log out of your current account',
                      style: TextStyle(fontSize: 13, color: neutral3Color)),
                  trailing:
                      const Icon(Icons.arrow_forward_ios, color: neutral1Color),
                  horizontalTitleGap: 10,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Are you sure?'),
                        content: const Text('Do you want to exit an App'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            //<-- SEE HERE
                            child: const Text('No'),
                          ),
                          TextButton(
                            onPressed: () =>    setLoggedOut(context),
                            // <-- SEE HERE
                            child: const Text('Yes'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void resetPassWord(String email, context) async {
    try {
      await auth.sendPasswordResetEmail(email: email).then((value) {
        ShowAlertDialog.showDoneDialog(
            context, "email sent", "Try check spam inbox", null);
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

  _buildCountryPickerDropdownSoloExpanded(context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .1,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CountryPickerDropdown(
              //show'em (the text fields) you're in charge now
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              //if you want your dropdown button's selected item UI to be different
              //than itemBuilder's(dropdown menu item UI), then provide this selectedItemBuilder.
              onValuePicked: (Country country) {
                CacheHelper.saveData(key: countryKey, value: country.name);
                print("${country.name}");
              },
              itemBuilder: (Country country) {
                return Row(
                  children: <Widget>[
                    SizedBox(width: 10.0),
                    CountryPickerUtils.getDefaultFlagImage(country),
                    SizedBox(width: 8.0),
                    Expanded(child: Text(country.name)),
                  ],
                );
              },
              itemHeight: null,
              isExpanded: true,
              initialValue: 'EG',
              icon: Icon(Icons.arrow_forward_ios, color: neutral1Color),
            ),
          ),
        ),
      ),
    );
  } Future<void> x () async {
    if (await canLaunchUrl(url)) {
      launchUrl(url,webViewConfiguration: WebViewConfiguration(enableDomStorage: true,enableJavaScript: true,));
    }else
      throw 'Could not launch $url';

  }  final Uri url = Uri.parse(
      'whatsapp://send?phone=%2B201029134380&text=Hello World!');
}
