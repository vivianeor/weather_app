import 'package:flutter/material.dart';
import 'package:weather_app/features/home/presentation/controllers/home_controller.dart';
import 'package:weather_app/features/home/presentation/ui/pages/home/widgets/weather_forecast_hourly.widget.dart';
import 'package:weather_app/features/home/presentation/ui/pages/home/widgets/weather_forecast_next_days.widget.dart';
import 'package:weather_app/features/home/presentation/ui/pages/home/widgets/weather_forecast_now.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController _homeController;
  final bool _todayForecastVisible = true;
  final double _height = 600;
  bool _isSmallSize = false;

  @override
  void initState() {
    // _homeController = HomeCo
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _isSmallSize = !_isSmallSize;
    return Scaffold(
      backgroundColor: const Color(0xff061225),
      body: Column(
        children: [
          WeatherForecastNow(height: _height, isSmallSize: _isSmallSize),
          _isSmallSize
              ? WeatherForecastHourly(
                  height: _height,
                  todayForecastVisible: _todayForecastVisible,
                )
              : WeatherForecastNextDays(
                  todayForecastVisible: _todayForecastVisible,
                )
        ],
      ),
    );
  }
}
