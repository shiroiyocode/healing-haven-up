import 'package:flutter/material.dart';
import 'package:healing_haven/intro%20page/intro_page1.dart';
import 'package:healing_haven/intro%20page/intro_page2.dart';
import 'package:healing_haven/intro%20page/intro_page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  //Page Controller
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              IntroPage1(controller: _controller),
              IntroPage2(controller: _controller),
              IntroPage3(controller: _controller),
            ],
          ),
          if (deviceOrientation == Orientation.portrait)
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 40),
              child: Container(
                alignment: Alignment(-0.7, 0.1),
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.white,
                    dotHeight: 14,
                    dotWidth: 18,
                    radius: 20,
                  ),
                ),
              ),
            ),
          if (deviceOrientation == Orientation.landscape)
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 40),
              child: Container(
                alignment: Alignment(0.25, -1),
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.white,
                    dotHeight: 14,
                    dotWidth: 18,
                    radius: 20,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
