import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/features/home/presentation/controllers/home_controller.dart';
import 'package:weather_app/features/home/presentation/ui/component/curent_weather.component.dart';
import 'package:weather_app/features/home/presentation/ui/component/hourly_weather.component.dart';
import 'package:weather_app/features/home/presentation/ui/component/info_current_weather.component.dart';

import '../../../domain/entities/current_weather.entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = GetIt.instance<HomeController>();

  @override
  void initState() {
    controller.getCurrentWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<CurrentWeatherEntity?>(
        valueListenable: controller.currentWeatherNotifier,
        builder: (context, currentWeatherResult, _) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 80),
                  child: Text(currentWeatherResult?.name ?? '',
                      style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 18))),
                ),
                CurrentWeatherComponent(result: currentWeatherResult),
                const Divider(),
                InfoCurrentWeatherComponent(result: currentWeatherResult),
                const Divider(),
                HourlyWeatherComponent(),
              ],
            ),
          );
        }
      ),
    );
  }
}
