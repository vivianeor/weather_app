import 'package:flutter/material.dart';
import 'package:weather_app/features/home/presentation/ui/atoms/text_label.dart';
import 'package:weather_app/features/home/presentation/ui/atoms/text_label_bold.dart';

class HourlyWeatherComponent extends StatefulWidget {
  const HourlyWeatherComponent({Key? key}) : super(key: key);

  @override
  State<HourlyWeatherComponent> createState() => _HourlyWeatherComponentState();
}

class _HourlyWeatherComponentState extends State<HourlyWeatherComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, i) {
            return Container(
             margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextLabel(label: 'agora'),
                  TextLabelBold(label: '17º')
                ],
              ),
            );
          }),
    );
  }
}
