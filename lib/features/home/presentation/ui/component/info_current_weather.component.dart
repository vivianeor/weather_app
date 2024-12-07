import 'package:flutter/material.dart';
import 'package:weather_app/features/home/domain/entities/current_weather.entity.dart';
import '../atoms/text_label.dart';
import '../atoms/text_label_bold.dart';

class InfoCurrentWeatherComponent extends StatefulWidget {
  final CurrentWeatherEntity? result;

  const InfoCurrentWeatherComponent({Key? key, required this.result}) : super(key: key);

  @override
  State<InfoCurrentWeatherComponent> createState() => _InfoCurrentWeatherComponentState();
}

class _InfoCurrentWeatherComponentState extends State<InfoCurrentWeatherComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextLabel(label: 'min.'),
                  const SizedBox(width: 5),
                  TextLabelBold(
                      label:
                          showAsIntegerNumber(widget.result?.mainInformation?.tempMin)),
                  const SizedBox(width: 1),
                  const TextLabel(label: 'º'),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextLabel(label: 'humidity'),
                  const SizedBox(width: 5),
                  TextLabelBold(
                      label: '${widget.result?.mainInformation?.humidity.toString()}%',
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Row(
                children: [
                  const TextLabel(label: 'max.'),
                  const SizedBox(width: 5),
                  TextLabelBold(
                      label:
                          showAsIntegerNumber(widget.result?.mainInformation?.tempMax)),
                  const SizedBox(width: 1),
                  const TextLabel(label: 'º'),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const TextLabel(label: 'wind'),
                  const SizedBox(width: 5),
                  TextLabelBold(
                      label: '${widget.result?.wind?.speed.toString()} m/s'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  String showAsIntegerNumber(double? temperature) {
    int truncateTemp = temperature != null ? temperature.toInt() : 0;
    return truncateTemp.toString();
  }
}
