import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';

//https://dribbble.com/shots/15661680-Weather-App

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _todayForecastVisible = true;
  double _height = 600;
  bool _isSmallSize = false;

  @override
  void initState() {
    super.initState();
    _isSmallSize = !_isSmallSize;
  }

  @override
  Widget build(BuildContext context) {
    _isSmallSize = !_isSmallSize;
    return Scaffold(
      backgroundColor: const Color(0xff061225),
      body: Column(
        children: [
          _currentWeather(_height, _isSmallSize),
         _isSmallSize ? _currentWeatherHourly(_height) :
          _weatherForecastNextDays(_height)
        ],
      ),
    );
  }

  Widget _currentWeather(double height, bool _isSmallSize ) {
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 40),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(70),
              bottomRight: Radius.circular(70)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Color(0Xff15bff6), Color(0Xff1490d8),
                Color(0Xff126cf3)]),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child:
          _isSmallSize ?
          AnimatedOpacity(
            key: const Key("key1"),
            opacity: _isSmallSize ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Icon(Icons.pin_drop, size: 25, color: Colors.white),
                      SizedBox(width: 5),
                      Text('Piracicaba', style:
                      TextStyle(fontSize: 25, color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: [
                      Lottie.asset('assets/animations/sunny.json', width: 160),
                      const Text('31º',
                          style: TextStyle(fontSize: 85,
                              fontFamily: 'Lato Bold',
                              fontWeight: FontWeight.normal,
                              color: Colors.white
                          )),
                      const Text('Ensolarado', style: TextStyle(fontSize: 25,
                          color: Colors.white))
                    ],
                  )
                ],
              ),
            ),
          )
          :
          AnimatedOpacity(
            key: const Key("key2"),
            opacity: !_isSmallSize ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.calendar_month, size: 25, color: Colors.white),
                    SizedBox(width: 5),
                    Text('7 dias', style:
                    TextStyle(fontSize: 25, color: Colors.white)),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width:  MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset('assets/animations/sunny.json',
                                width: MediaQuery.of(context).size.height * .2),
                            const SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Amanhã', style: TextStyle(fontSize: 30, color: Colors.white)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Text('20º', style: TextStyle(fontSize: 60, color: Colors.white)),
                                    Text('/17º', style: TextStyle(fontSize: 25, color: const Color(0xFFffffff).withOpacity(0.5))),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _currentWeatherHourly(double height) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Hoje', style: TextStyle(fontSize: 26,
                  color: Colors.white, fontWeight: FontWeight.w600)),
              GestureDetector(
                onTap: (){
                  setState(() {
                   // height = 550;
                    _todayForecastVisible = !_todayForecastVisible;
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  width: 120,
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
        )
      ],
    );
  }

  Widget _weatherForecastNextDays(double height) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: GestureDetector(
            onTap: (){
              setState(() {
                //height = 550;
                _todayForecastVisible = !_todayForecastVisible;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
                    Text(
                        'Hoje',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ],
                ),
                const Text('Nos próximos 7 dias', style: TextStyle(fontSize: 26,
                    color: Colors.white, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.red,
          height: MediaQuery.of(context).size.height * .45,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 12,
            itemBuilder: (context, i){
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  const Text('Seg', style: TextStyle(fontSize: 22,
                    color: Colors.white)),
                  Row(
                    children: [
                      Lottie.asset('assets/animations/sunny.json', width: 30),
                      const Text('Ensolarado', style: TextStyle(fontSize: 22,
                          color: Colors.white)),
                    ],
                  ),
                  const Text('min 23º max 28º', style: TextStyle(fontSize: 22,
                      color: Colors.white)),
                  ],
                ),
              );
            }
          ),
        )
      ],
    );
  }
}
