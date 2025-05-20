import 'package:flutter/material.dart';
import 'package:healing_haven/intro%20page/utils/blended_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage3 extends StatelessWidget {
  final PageController controller;
  final bool showPageIndicatorInside;
  const IntroPage3({
    super.key,
    required this.controller,
    this.showPageIndicatorInside = false,
  });

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final screenSize = MediaQuery.of(context).size;

    if (orientation == Orientation.portrait) {
      // 📱 Portrait Layout
      return Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: BlendedImage(
                  imageAsset: 'lib/images/6.png',
                  blendColor: Color(0xFF422b19),
                ),
              ),
            ],
          ),
          Positioned(
            top: screenSize.height * 0.56,
            left: 32,
            right: 32,
            child: Text(
              "Trusted Dermatologist in Manila",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.74,
            left: 32,
            right: 32,
            child: Text(
              "Patient's Bestfriend. I want to prove that dermatology is for everyone. That includes people of all sizes & orientations.",
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 32,
            right: 32,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () async {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/loginpage',
                  (Route<dynamic> route) => false,
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      // 💻 Landscape Layout
      return Row(
        children: [
          // Left Half Image - Fills height, full image shown
          Expanded(
            flex: 1,
            child: SizedBox.expand(
              child: Image.asset(
                'lib/images/6.png',
                fit: BoxFit.fill, // Show full image
              ),
            ),
          ),

          // Right Half Content with Background Color
          Expanded(
            flex: 1,
            child: Container(
              color: const Color(0xFF422b19), // Background color
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showPageIndicatorInside) ...[
                    SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Colors.white,
                        dotHeight: 14,
                        dotWidth: 18,
                        radius: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                  const Text(
                    "Trusted Dermatologist in Manila",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Patient's Bestfriend. I want to prove that dermatology is for everyone. That includes people of all sizes & orientations.",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () async {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/loginpage',
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
  }
}
