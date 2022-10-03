import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

import '../../../utilites/app_colors.dart';

class MyWallet extends StatelessWidget {
  const MyWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: neutral5Color,
            onPressed: () {},
            child: const Icon(
              Icons.add,
              color: neutral1Color,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
          color: neutral1Color,
        ),
        elevation: 0,
        backgroundColor: neutral5Color,
        centerTitle: true,
        title: const Text(
          'My Wallet',
          style: TextStyle(
            color: neutral1Color,
          ),
        ),
      ),
      body: Column(
        children: [
          CreditCardWidget(
            cardNumber: '7741   6588   2123   6644',
            expiryDate: '12/22',
            cardHolderName: 'Kristin Watson',
            cvvCode: '',
            showBackView: false,
            onCreditCardWidgetChange: (creditCardBrand) {},
          ),
          myContainer('Apple Pay', '\$346.84', w),
          myContainer('PayPal', '\$91.84', w),
          myContainer('Payoneer', null, w),
        ],
      ),
    );
  }

  Widget myContainer(String text1, String? text2, w) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
        color: neutral5Color,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
      height: 70,
      width: w - 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: (text2 == null)
            ? [
                Text(
                  text1,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  width: 100,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                ),
              ]
            : [
                Text(
                  text1,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  width: 100,
                ),
                Text(
                  text2,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
      ),
    );
  }
}
