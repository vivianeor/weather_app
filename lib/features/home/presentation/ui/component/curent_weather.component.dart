import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/enums/colors.dart';
import 'package:weather_app/features/home/domain/entities/current_weather.entity.dart';
import 'package:weather_app/features/home/presentation/ui/atoms/text_label_bold.dart';

import '../atoms/text_label.dart';

class CurrentWeatherComponent extends StatefulWidget {
  final CurrentWeatherEntity? result;

  const CurrentWeatherComponent({Key? key, required this.result}) : super(key: key);

  @override
  State<CurrentWeatherComponent> createState() => _CurrentWeatherComponentState();
}

class _CurrentWeatherComponentState extends State<CurrentWeatherComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                showAsIntegerNumber(widget.result?.mainInformation?.temp),
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 140, height: 1.0),
                ),
              ),
              const TextLabel(label: 'ºC'),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .22,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.ac_unit, color: ColorsEnum.grey, size: 35),
                const SizedBox(height: 25),
                Visibility(
                  child: TextLabel(label: widget.result?.weatherList![0].description),
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    TextLabel(label: 'feels like'),
                    const SizedBox(width: 10),
                    TextLabelBold(label: showAsIntegerNumber(widget.result?.mainInformation?.feelsLike)),
                    const SizedBox(width: 1),
                    TextLabel(label: 'ºC'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String showAsIntegerNumber(double? temperature) {
    int truncateTemp = temperature != null ? temperature.toInt() : 0;
    return truncateTemp.toString();
  }
}
