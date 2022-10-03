import 'package:flutter/material.dart';

import '../../../utilites/app_colors.dart';

class MyCoupons extends StatelessWidget {
  MyCoupons({Key? key}) : super(key: key);
  final List details = [
    Coupon(
      addressCoupon: 'Mobile Application Development',
      discountPercentage: '10',
      activationCode: 'START',
    ),
    Coupon(
      addressCoupon: 'UI/UX Design',
      discountPercentage: '30',
      activationCode: '4386',
    ),
    Coupon(
      addressCoupon: 'Java from Scratch to Expert',
      discountPercentage: '25',
      activationCode: 'JAVA',
    ),
    Coupon(
      addressCoupon: 'Instagram Marketing 2022',
      discountPercentage: '40',
      activationCode: '354715',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neutral5Color,
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
          'My Coupons',
          style: TextStyle(
            color: neutral1Color,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: details.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shadowColor: neutral1Color,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                onTap: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                horizontalTitleGap: 0,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: SizedBox(
                  width: 75,
                  child: Row(
                    children: [
                      Text(
                        details[index].discountPercentage,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      const SizedBox(
                        width: 2.5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '%',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            'off',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                        height: 30,
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Divider(
                            color: neutral1Color,
                            thickness: 2.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                title: Text(
                  details[index].addressCoupon,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: neutral1Color,
                  ),
                ),
                subtitle: Text(
                  'Activation code: ${details[index].activationCode}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: neutral2Color,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(20),
      //   child: ListView.builder(
      //     itemCount: details.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       return Container(
      //         margin: const EdgeInsets.only(bottom: 10),
      //         padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
      //         height: 90,
      //         width: 335,
      //         decoration: BoxDecoration(
      //           boxShadow: [
      //             BoxShadow(
      //               color: Colors.grey.withOpacity(0.5),
      //               spreadRadius: 1,
      //               blurRadius: 5,
      //             ),
      //           ],
      //           color: neutral5Color,
      //           borderRadius: BorderRadius.circular(10),
      //         ),
      //         child: Expanded(
      //           child: Row(
      //             children: [
      //               Text(
      //                 details[index].discountPercentage,
      //                 style: const TextStyle(
      //                     fontWeight: FontWeight.bold, fontSize: 30),
      //               ),
      //               const SizedBox(
      //                 width: 2.5,
      //               ),
      //               Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: const [
      //                   Text(
      //                     '%',
      //                     style: TextStyle(
      //                         fontWeight: FontWeight.bold, fontSize: 18),
      //                   ),
      //                   Text(
      //                     'off',
      //                     style: TextStyle(
      //                         fontWeight: FontWeight.bold, fontSize: 14),
      //                   ),
      //                 ],
      //               ),
      //               const SizedBox(
      //                 width: 15,
      //                 height: 40,
      //                 child: RotatedBox(
      //                   quarterTurns: 1,
      //                   child: Divider(
      //                     color: neutral1Color,
      //                     thickness: 2.0,
      //                   ),
      //                 ),
      //               ),
      //               Expanded(
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       details[index].addressCoupon,
      //                       style: const TextStyle(
      //                         fontSize: 15,
      //                         fontWeight: FontWeight.bold,
      //                         color: neutral1Color,
      //                       ),
      //                     ),
      //                     Text(
      //                       'Activation code: ${details[index].activationCode}',
      //                       style: const TextStyle(
      //                         fontWeight: FontWeight.bold,
      //                         fontSize: 12,
      //                         color: neutral2Color,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       );
      //     },
      //   ),
      // ),
    );
  }
}

class Coupon {
  Coupon({
    required this.addressCoupon,
    required this.discountPercentage,
    required this.activationCode,
  });

  String addressCoupon;
  String discountPercentage;
  String activationCode;
}
