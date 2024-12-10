import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/enums/colors.dart';
import 'package:weather_app/features/home/presentation/controllers/home_controller.dart';
import 'package:weather_app/features/home/presentation/ui/component/curent_weather.component.dart';
import 'package:weather_app/features/home/presentation/ui/component/error.component.dart';

import '../../../domain/entities/current_weather.entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = GetIt.instance<HomeController>();
  late final Future<void> initialization;
  TextEditingController controllerText = TextEditingController();
  String formattedDate = DateFormat('EEEE, dd MMM').format(DateTime.now());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.orange.shade200,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.78,
                  height: MediaQuery.of(context).size.height * 0.75,
                  padding: const EdgeInsets.all(15),
                  child: FutureBuilder(
                    future: controller.getCurrentWeather(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError || snapshot.error != null) {
                        return const ErrorComponent();
                      }
                      if (snapshot.connectionState != ConnectionState.done) {
                        return Center(
                            child: CircularProgressIndicator(
                                color: ColorsEnum.grey));
                      }
                      return ValueListenableBuilder<CurrentWeatherEntity?>(
                        valueListenable: controller.currentWeatherNotifier,
                        builder: (context, currentWeatherResult, _) {
                          return Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        const Icon(Icons.location_on,
                                            color: Color.fromARGB(
                                                255, 117, 117, 117)),
                                        Text(
                                          currentWeatherResult?.name ?? '',
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                              fontSize: 18,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            color: const Color.fromARGB(
                                                255, 117, 117, 117),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      formattedDate,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          overflow: TextOverflow.ellipsis,
                                          color: Color.fromARGB(
                                              255, 117, 117, 117)),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: CurrentWeatherComponent(
                                  result: currentWeatherResult,
                                  controller: controller,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
