import 'dart:math';
import 'dart:ui';

Color colorTempToRGB(double colorTemp, int brightness) {
  final temp = colorTemp / 100;

  final red = temp <= 66
      ? brightness
      : (pow(temp - 60, -0.1332047592) * 329.698727446)
          .round()
          .clamp(0, brightness);

  final green = temp <= 66
      ? (99.4708025861 * log(temp) - 161.1195681661)
          .round()
          .clamp(0, brightness)
      : (pow(temp - 60, -0.0755148492) * 288.1221695283)
          .round()
          .clamp(0, brightness);

  final blue = temp >= 66
      ? brightness
      : temp <= 19
          ? 0
          : (138.5177312231 * log(temp - 10) - 305.0447927307)
              .round()
              .clamp(0, brightness);

  return Color.fromARGB(brightness, red, green, blue);
}
