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
  double _height = 700;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff061225),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is UserScrollNotification) {
            if (notification.direction == ScrollDirection.forward) {
              setState(() {
                _height = 550;
              });
            } else if (notification.direction == ScrollDirection.reverse) {
              setState(() {
                _height = 750;
              });
            }
          }
          return false;
        },
        child: ListView(
          children: [
            _currentWeather(),
            _currentWeatherHourly()
          ],
        ),
      ),
    );
  }

  Widget _currentWeather() {
    return  AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: _height,
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Icon(Icons.pin_drop, size: 32, color: Colors.white),
              SizedBox(width: 5),
              Text('Piracicaba', style:
              TextStyle(fontSize: 32, color: Colors.white)),
            ],
          ),
          Column(
            children: [
              Lottie.asset('assets/animations/sunny.json', width: 250),
              const Text('31º',
                  style: TextStyle(fontSize: 100,
                      fontFamily: 'Lato Bold',
                      fontWeight: FontWeight.normal,
                      color: Colors.white
                  )),
              const Text('Ensolarado', style: TextStyle(fontSize: 35,
                  color: Colors.white))
            ],
          )
        ],
      ),
    );
  }

  Widget _currentWeatherHourly() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Hoje', style: TextStyle(fontSize: 26,
                  color: Colors.white, fontWeight: FontWeight.w600)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      //diminuir o tamanho do azul
                      //desaparecer a previsão de hoje
                      //mostrar a lista de previsão dos proximos dias
                    },
                    child: const Text(
                        '7 dias',
                        style: TextStyle(fontSize: 20, color: Colors.white))),
                  const Icon(Icons.chevron_right, color: Colors.white, size: 30)
                ],
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 135,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
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
}
