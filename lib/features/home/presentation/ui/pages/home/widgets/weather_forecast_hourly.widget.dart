import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WeatherForecastHourly extends StatefulWidget {
  final double height;
  bool todayForecastVisible = true;
  WeatherForecastHourly({
    required this.height,
    required this.todayForecastVisible,
    Key? key,
  }) : super(key: key);

  @override
  State<WeatherForecastHourly> createState() => _WeatherForecastHourlyState();
}

class _WeatherForecastHourlyState extends State<WeatherForecastHourly> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                  'Hoje',
                  style: TextStyle(fontSize: 26,
                      color: Colors.white, fontWeight: FontWeight.w600)),
              GestureDetector(
                onTap: (){
                  setState(() {
                    // height = 550;
                    widget.todayForecastVisible = !widget.todayForecastVisible;
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                        '7 dias',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    Icon(Icons.chevron_right, color: Colors.white, size: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .45,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .15,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 140,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: .5)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('23º', style: TextStyle(fontSize: 22,
                                color: Colors.white)),
                            Lottie.asset('assets/animations/sunny.json', width: 60),
                            const Text('10:00', style: TextStyle(fontSize: 18,
                                color: Colors.white)),
                          ],
                        ),
                      );
                    }
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
