import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/controllers/global_controller.dart';
import 'package:weather_app/models/weather_hourly_data.dart';
import 'package:weather_app/utils/custom_colors.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyDataWidget({super.key, required this.weatherDataHourly});

  final RxInt cardIndex = GlobalController().getCurrentIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Today',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList() {
    return Container(
      height: 160,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        itemCount: weatherDataHourly.hourlyData.length > 12
            ? 15
            : weatherDataHourly.hourlyData.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Obx(
            () => Padding(
              padding: index == weatherDataHourly.hourlyData.length - 1
                  ? const EdgeInsets.fromLTRB(8, 0, 8, 0)
                  : const EdgeInsets.only(left: 8),
              child: GestureDetector(
                onTap: () {
                  cardIndex.value = index;
                },
                child: Container(
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: cardIndex.value == index
                        ? const LinearGradient(colors: [
                            CustomColors.firstGradientColor,
                            CustomColors.secondGradientColor,
                          ])
                        : const LinearGradient(colors: [
                            CustomColors.cardColor,
                            CustomColors.cardColor,
                          ]),
                  ),
                  child: HourlyDetails(
                    temp: weatherDataHourly.hourlyData[index].temp!,
                    timestamp: weatherDataHourly.hourlyData[index].dt!,
                    weatherIcon:
                        weatherDataHourly.hourlyData[index].weather![0].icon!,
                    currentIndex: cardIndex.value,
                    index: index,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class HourlyDetails extends StatelessWidget {
  final int temp;
  final int timestamp;
  final String weatherIcon;
  final int currentIndex;
  final int index;

  String getTime(var timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var time = DateFormat('jm').format(date);
    return time;
  }

  const HourlyDetails({
    super.key,
    required this.temp,
    required this.timestamp,
    required this.weatherIcon,
    required this.currentIndex,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            getTime(timestamp),
            style: TextStyle(
              color: currentIndex == index
                  ? Colors.white
                  : CustomColors.textColorBlack,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          height: 40,
          width: 40,
          child: Image.asset('assets/weather/$weatherIcon.png'),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            '$temp°',
            style: TextStyle(
              color: currentIndex == index
                  ? Colors.white
                  : CustomColors.textColorBlack,
            ),
          ),
        )
      ],
    );
  }
}
