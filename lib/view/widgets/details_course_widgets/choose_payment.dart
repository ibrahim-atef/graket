import 'package:flutter/material.dart';
import 'package:graket/view/widgets/details_course_widgets/choose_payment.dart';

import '../../../utilites/app_colors.dart';

class ChoosePayment extends StatefulWidget {
  const ChoosePayment({Key? key}) : super(key: key);

  @override
  State<ChoosePayment> createState() => _ChoosePaymentState();
}

class _ChoosePaymentState extends State<ChoosePayment> {
  final List detailsCard = [
    '4141 •••• •••• 3827',
    '7741 •••• •••• 6644',
    '4141 •••• •••• 3827',
    '7741 •••• •••• 6644',
  ];

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: neutral5Color,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: SizedBox(
          height: 55,
          width: w - 40,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              primary: primaryColor,
            ),
            child: const Text(
              'Save',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: neutral1Color,
          ),
        ),
        elevation: 0,
        backgroundColor: neutral5Color,
        centerTitle: true,
        title: const Text(
          'My Payment Methods',
          style: TextStyle(
            color: neutral1Color,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SizedBox(height: 50),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text(
                  'No Payment Methods Found',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            // Card(
            //   shadowColor: neutral2Color,
            //   elevation: 5,
            //   borderOnForeground: true,
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10)),
            //   child: ListTile(
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => const ChoosePayment()));
            //     },
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10)),
            //     contentPadding:
            //         const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            //     leading: const Padding(
            //       padding: EdgeInsets.all(10),
            //       child: Text(
            //         'Payment method',
            //         style: TextStyle(fontSize: 20),
            //       ),
            //     ),
            //     subtitle: const Padding(
            //       padding: EdgeInsets.all(10),
            //       child: Text(
            //         '',
            //         style: TextStyle(fontSize: 20),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  setSelectedCheckBox(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: (selectedIndex == index)
          ? Image.asset('assets/icons/boxselected.png')
          : Image.asset('assets/icons/boxunselected.png'),
    );
  }
}
