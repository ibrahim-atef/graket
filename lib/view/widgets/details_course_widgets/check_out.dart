import 'package:flutter/material.dart';
import 'package:graket/view/widgets/details_course_widgets/choose_payment.dart';

import '../../../utilites/app_colors.dart';
  import 'my_coupons.dart';

class CheckOut extends StatefulWidget {
  String id;

  CheckOut({Key? key, required this.id}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

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
          'CheckOut',
          style: TextStyle(
            color: neutral1Color,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 97, 245, 196),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/images/img.png'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "myCourse['name']",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: neutral1Color,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: ' mainprice ',
                              style: const TextStyle(
                                fontSize: 16,
                                color: neutral2Color,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            TextSpan(
                              text: ' price ',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: neutral1Color),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Card(
              shadowColor: neutral2Color,
              elevation: 5,
              borderOnForeground: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChoosePayment()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                leading: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Payment method',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                subtitle: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyCoupons(),
                    ));
              },
              splashColor: noneColor,
              focusColor: noneColor,
              hoverColor: noneColor,
              highlightColor: noneColor,
              child: const Padding(
                padding: EdgeInsets.only(top: 20, left: 15),
                child: Text(
                  'Apply a coupon  >',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Subtotal'),
 
                Text('myCoursemainprice'),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Discount'),
                Text('price - min p'),
              ],
            ),
            const SizedBox(
              height: 20,
              child: Divider(
                color: neutral1Color,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: primaryColor),
                ),
                Text(
                  'my cource',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: primaryColor),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 34),
              child: SizedBox(
                height: 55,
                width: w,
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    primary: primaryColor,
                  ),
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
