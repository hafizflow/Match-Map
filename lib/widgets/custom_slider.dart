import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/setting_provider.dart';

// custom slider
class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: const SliderThemeData(
        trackShape: CustomSliderTrackShape(),
        thumbShape: CustomSliderThumbShape(),
      ),
      child: Consumer<SettingProvider>(builder: (context, sliderProvider, _) {
        return Slider(
          min: 0,
          max: 15,
          divisions: 3,
          activeColor: Colors.black,
          inactiveColor: Colors.grey,
          value: sliderProvider.sliderValue,
          onChanged: (value) {
            sliderProvider.setSliderValue(value);
          },
        );
      }),
    );
  }
}

class CustomSliderTrackShape extends RoundedRectSliderTrackShape {
  const CustomSliderTrackShape();
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

class CustomSliderThumbShape extends RoundSliderThumbShape {
  const CustomSliderThumbShape({
    double enabledThumbRadius = 10.0,
  }) : super(enabledThumbRadius: enabledThumbRadius);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final double radius = enabledThumbRadius;
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius, paint);

    final Paint borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawCircle(center, radius, borderPaint);
  }
}
