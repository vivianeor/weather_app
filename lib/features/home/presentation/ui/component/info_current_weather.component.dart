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
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextLabel(label: 'min.'),
                  SizedBox(width: 5),
                  TextLabelBold(
                      label:
                          showAsIntegerNumber(widget.result?.mainInformation?.tempMin)),
                  SizedBox(width: 1),
                  TextLabel(label: 'º'),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextLabel(label: 'humidity'),
                  SizedBox(width: 5),
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
              SizedBox(height: 25),
              Row(
                children: [
                  TextLabel(label: 'max.'),
                  SizedBox(width: 5),
                  TextLabelBold(
                      label:
                          showAsIntegerNumber(widget.result?.mainInformation?.tempMax)),
                  SizedBox(width: 1),
                  TextLabel(label: 'º'),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  TextLabel(label: 'wind'),
                  SizedBox(width: 5),
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
