import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_daily_data.dart';
import 'package:weather_app/utils/custom_colors.dart';

class DailyDataWidget extends StatelessWidget {
  final WeateherDataDaily weateherDataDaily;
  const DailyDataWidget({
    super.key,
    required this.weateherDataDaily,
  });

  // get the day
  String getDay(var timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var day = DateFormat("EEE").format(dateTime);
    return day;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: CustomColors.dividerLine.withAlpha(150),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(bottom: 10),
            child: const Text(
              'Next Days',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
                color: CustomColors.textColorBlack,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 320,
      child: ListView.builder(
        itemCount: weateherDataDaily.dailyData.length > 7
            ? 7
            : weateherDataDaily.dailyData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      getDay(weateherDataDaily.dailyData[index].dt),
                      style: const TextStyle(
                        color: CustomColors.textColorBlack,
                        fontSize: 17,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/weather/${weateherDataDaily.dailyData[index].weather![0].icon}.png',
                          height: 40,
                          width: 40,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          weateherDataDaily.dailyData[index].weather![0].main!,
                        ),
                      ],
                    ),
                    Text(
                      '${weateherDataDaily.dailyData[index].temp!.max}°/${weateherDataDaily.dailyData[index].temp!.min}°',
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: CustomColors.dividerLine,
              ),
            ],
          );
        },
      ),
    );
  }
}
