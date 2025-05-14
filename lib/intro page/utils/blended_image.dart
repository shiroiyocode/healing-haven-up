import 'package:flutter/material.dart';

class BlendedImage extends StatelessWidget {
  final String imageAsset;
  final Color blendColor;

  const BlendedImage({
    super.key,
    required this.imageAsset,
    required this.blendColor,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final imageHeight = constraints.maxHeight * 0.5;
        return Stack(
          children: [
            SizedBox(
              height: imageHeight,
              width: double.infinity,
              child: Image.asset(imageAsset, fit: BoxFit.cover),
            ),
            Positioned(
              top: imageHeight * 0.99,
              left: 0,
              right: 0,
              bottom: 0,
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, blendColor],
                    stops: const [0.0, 1.0],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstOver,
                child: ColoredBox(color: blendColor),
              ),
            ),
          ],
        );
      },
    );
  }
}
