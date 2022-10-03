import 'package:flutter/material.dart';
import '../../../utilites/app_colors.dart';

class ShowAlertDialog {
  static showDoneDialog(
      BuildContext context, String title, String subTitle, page) {
    Size size = MediaQuery.of(context).size;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: Image.asset('assets/images/infocorrect.png'),
          content: Column(
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 25,
                      color: neutral1Color,
                      fontWeight: FontWeight.bold)),
              Text(
                subTitle,
                style: const TextStyle(fontSize: 15, color: neutral3Color),
              )
            ],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          actionsPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.of(context).pop();

                  page != null
                      ? Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => page))
                      : null;
                },
                child: Container(
                  alignment: Alignment.center,
                  width: size.width - 40,
                  height: 45,
                  child: const Text("Continue",
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                )),
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      },
    );
  }

  showErrorDialog(
    BuildContext context,
    String title,
    String subTitle,
  ) {
    Size size = MediaQuery.of(context).size;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: Image.asset('assets/images/infoincorrect.png'),
          content: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 25,
                    color: neutral1Color,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                subTitle,
                style: const TextStyle(fontSize: 15, color: neutral3Color),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          actionsPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  primary: semantic1Color,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: size.width - 40,
                  height: 45,
                  child: const Text(
                    "Try Again",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                )),
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      },
    );
  }
}
