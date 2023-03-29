import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/features/home/presentation/ui/component/curent_weather.component.dart';
import 'package:weather_app/features/home/presentation/ui/component/hourly_weather.component.dart';
import 'package:weather_app/features/home/presentation/ui/component/info_current_weather.component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('san franscisco', style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 20))),
          CurrentWeatherComponent(),
          InfoCurrentWeatherComponent(),
          HourlyWeatherComponent()
        ],
      ),
    );
  }
}
