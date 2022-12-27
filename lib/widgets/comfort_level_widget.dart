import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather_app/models/weather_current_data.dart';
import 'package:weather_app/utils/custom_colors.dart';

class ConfortLevelWidget extends StatelessWidget {
  final WeatherDataCurrent current;
  const ConfortLevelWidget({
    super.key,
    required this.current,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
          child: const Text(
            'Comfort Level',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 150,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: current.currentData.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                    customWidths: CustomSliderWidths(
                      handlerSize: 0,
                      progressBarWidth: 12,
                      trackWidth: 12,
                    ),
                    infoProperties: InfoProperties(
                      bottomLabelText: 'Humidity',
                      bottomLabelStyle: const TextStyle(
                        color: CustomColors.textColorBlack,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    animationEnabled: true,
                    size: 140,
                    customColors: CustomSliderColors(
                      hideShadow: true,
                      trackColor:
                          CustomColors.firstGradientColor.withAlpha(100),
                      progressBarColors: [
                        CustomColors.firstGradientColor,
                        CustomColors.secondGradientColor,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
