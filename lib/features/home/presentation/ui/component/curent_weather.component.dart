import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/features/home/domain/entities/current_weather.entity.dart';

import '../../controllers/home_controller.dart';
import '../atoms/text_label.dart';

class CurrentWeatherComponent extends StatefulWidget {
  final CurrentWeatherEntity? result;
  final HomeController controller;

  const CurrentWeatherComponent({
    Key? key,
    required this.result,
    required this.controller,
  }) : super(key: key);

  @override
  State<CurrentWeatherComponent> createState() =>
      _CurrentWeatherComponentState();
}

class _CurrentWeatherComponentState extends State<CurrentWeatherComponent> {
  String? iconCode;
  String? iconUrl;

  @override
  void initState() {
    iconCode = widget.result?.weatherList?[0].icon;
    iconUrl = "https://openweathermap.org/img/wn/$iconCode@2x.png";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          iconUrl ?? '',
          width: 170,
          height: 170,
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              showAsIntegerNumber(widget.result?.mainInformation?.temp),
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(fontSize: 110, height: 0.8),
              ),
            ),
            const TextLabel(label: 'ºC'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            Visibility(
              child: Text(
                widget.controller.description ?? '',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 18),
                  color: const Color.fromARGB(255, 117, 117, 117),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'sensação térmica',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(fontSize: 14),
                    color: const Color.fromARGB(255, 117, 117, 117),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  showAsIntegerNumber(
                      widget.result?.mainInformation?.feelsLike),
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 14),
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(width: 0.8),
                const TextLabel(label: 'ºC'),
              ],
            ),
          ],
        )
      ],
    );
  }

  String showAsIntegerNumber(double? temperature) {
    int truncateTemp = temperature != null ? temperature.toInt() : 0;
    return truncateTemp.toString();
  }
}
