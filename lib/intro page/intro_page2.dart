import 'package:flutter/material.dart';
import 'package:healing_haven/intro%20page/utils/blended_image.dart';

class IntroPage1 extends StatelessWidget {
  final PageController controller;
  const IntroPage1({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: BlendedImage(
                imageAsset: 'lib/images/8.png',
                blendColor: Color.fromARGB(255, 100, 81, 66),
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment(0, 0.9),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                controller.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "Continue",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 38.0),
          child: SizedBox(
            width: 300,
            child: Container(
              alignment: Alignment(-0.7, 0.6),
              child: Text(
                "Still struggling even after doing everything? Im here for you.",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
        Container(
          alignment: const Alignment(-0.7, 0.35),
          child: const SizedBox(
            width: 300, // Adjust this width as needed
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                "Still Struggling Despite Trying Everything?",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ), // Adjust font size
              ),
            ),
          ),
        ),
      ],
    );
  }
}
