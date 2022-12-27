import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controllers/global_controller.dart';
import 'package:weather_app/utils/custom_colors.dart';
import 'package:weather_app/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final globalController = Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const HeaderWidget(),
                    const SizedBox(height: 20),
                    // for our current temperature
                    CurrentWeatherWidget(
                      weatherDataCurrent:
                          globalController.getWeatherData().getCurrentWeather(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    HourlyDataWidget(
                      weatherDataHourly:
                          globalController.getWeatherData().getHourlyWeather(),
                    ),
                    DailyDataWidget(
                      weateherDataDaily:
                          globalController.getWeatherData().getDailyWeather(),
                    ),
                    Container(
                      height: 1,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      color: CustomColors.dividerLine,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ConfortLevelWidget(
                      current:
                          globalController.getWeatherData().getCurrentWeather(),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
