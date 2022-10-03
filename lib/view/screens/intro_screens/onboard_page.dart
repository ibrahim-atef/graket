import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:graket/view/screens/app_main_page.dart';
import 'package:graket/view/screens/auth_screens/signin_page.dart';

import '../../../Routes/routing.gr.dart';
import '../../../utilites/app_colors.dart';
import '../../../utilites/reusable_func.dart';
import '../../../view_model/api_helper/local/shared_preferences.dart';



class OnboardPage extends StatefulWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  final PageController _pageController = PageController();
  void getStarted(context) {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateAndKill(context, SignInPage());
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    return Scaffold(
      body: OnBoard(
        pageController: _pageController,
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        onSkip: () {
          // print('skipped');
        },
        // Either Provide onDone Callback or nextButton Widget to handle done state
        onDone: () {
          // print('done tapped');
        },
        onBoardData: onBoardData,
        titleStyles: const TextStyle(
          color: neutral1Color,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.15,
        ),
        descriptionStyles: const TextStyle(
          fontSize: 16,
          color: neutral3Color,
        ),
        pageIndicatorStyle: const PageIndicatorStyle(
          width: 100,
          inactiveColor: neutral3Color,
          activeColor: primaryColor,
          inactiveSize: Size(8, 8),
          activeSize: Size(12, 12),
        ),
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        skipButton: Padding(
          padding: const EdgeInsets.only(top: 20, right: 10),
          child: TextButton(
            onPressed: () {
              navigateAndKill(context,SignInPage());
              /* Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const SignInPage())); */
            },
            child: const Text(
              "skip >",
              style: TextStyle(color: primaryColor, fontSize: 20),
            ),
          ),
        ),
        // Either Provide onDone Callback or nextButton Widget to handle done state
        nextButton: OnBoardConsumer(
          builder: (context, ref, child) {
            final state = ref.watch(onBoardStateProvider);
            return InkWell(
              onTap: () => _onNextTap(state),
              child: Container(
                width: width - 100,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [primaryColor, primaryColor],
                  ),
                ),
                child: Text(
                  state.isLastPage ? "Start learning" : "Next",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
getStarted(context);
      /* Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const SignInPage())); */
    }
  }
}

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(
    title: "Learn everywhere",
    description: "Develop valueable skill\n anytime, anywhere",
    imgUrl: 'assets/images/onboard1.png',
  ),
  const OnBoardModel(
    title: "Connect to the world",
    description: "Connect with the world\n just in your phone",
    imgUrl: 'assets/images/onboard2.png',
  ),
  const OnBoardModel(
    title: "Safe & Secure",
    description: "Payment, courses are insecure\n Your information is safe!",
    imgUrl: 'assets/images/onboard3.png',
  ),
];
