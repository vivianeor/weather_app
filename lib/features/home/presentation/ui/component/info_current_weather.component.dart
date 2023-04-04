import 'package:flutter/material.dart';
import '../atoms/text_label.dart';
import '../atoms/text_label_bold.dart';

class HourlyWeatherComponent extends StatefulWidget {
  const HourlyWeatherComponent({Key? key}) : super(key: key);

  @override
  State<HourlyWeatherComponent> createState() => _HourlyWeatherComponentState();
}

class _HourlyWeatherComponentState extends State<HourlyWeatherComponent> {
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
              Row(
                children: [
                  Icon(Icons.ac_unit),
                  SizedBox(width: 5),
                  TextLabelBold(label: '24º'),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextLabel(label: 'humidade'),
                  SizedBox(width: 5),
                  TextLabelBold(label:'63%'),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextLabel(label:'uv index'),
                  SizedBox(width: 5),
                  TextLabelBold(label:'2'),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.ac_unit),
                  SizedBox(width: 5),
                  TextLabelBold(label: '11º'),
                ],
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  TextLabel(label: 'vento'),
                  SizedBox(width: 5),
                  TextLabelBold(label:'5 m/s'),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  TextLabel(label:'pressão'),
                  SizedBox(width: 5),
                  TextLabelBold(label:'764'),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
