import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/features/home/presentation/controllers/home_controller.dart';
import 'package:weather_app/features/home/presentation/ui/component/curent_weather.component.dart';
import 'package:weather_app/features/home/presentation/ui/component/hourly_weather.component.dart';
import 'package:weather_app/features/home/presentation/ui/component/info_current_weather.component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final getIt = GetIt.instance;
  late HomeController controller;

  @override
  void initState() {
    getIt.registerSingleton<HomeController>(HomeController(getIt()));
    controller = getIt.get<HomeController>();
    controller.getCurrentWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Text('san franscisco',
                  style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 18))),
            ),
            const CurrentWeatherComponent(),
            const Divider(),
            InfoCurrentWeatherComponent(),
            const Divider(),
            HourlyWeatherComponent(),
          ],
        ),
      ),
    );
  }
}
