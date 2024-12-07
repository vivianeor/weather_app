import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/features/home/domain/entities/current_weather.entity.dart';
import 'package:weather_app/features/home/presentation/ui/atoms/text_label_bold.dart';

import '../atoms/text_label.dart';

class CurrentWeatherComponent extends StatefulWidget {
  final CurrentWeatherEntity? result;

  const CurrentWeatherComponent({Key? key, required this.result})
      : super(key: key);

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
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: 20),
        Image.network(
          iconUrl ?? '',
          width: 150,
          height: 150,
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
            const SizedBox(height: 10),
            Visibility(
              child:
                  TextLabel(label: widget.result?.weatherList?[0].description),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextLabel(label: 'sensação térmica'),
                const SizedBox(width: 10),
                TextLabelBold(
                    label: showAsIntegerNumber(
                        widget.result?.mainInformation?.feelsLike)),
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
