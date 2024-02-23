import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorComponent extends StatelessWidget {
  const ErrorComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Não foi possível obter a informação de clima no momento.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(fontSize: 20),
              color: Colors.black26,
            ),
          ),
          const SizedBox(width: 25),
          Text(
            'Tente novamente mais tarde!',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(fontSize: 18),
              color: Colors.black26,
            ),
          ),
          const SizedBox(width: 100),
          Image.asset(
            'assets/image/error.png',
            fit: BoxFit.fill,
            height: 150,
            width: 150,
          )
        ],
      ),
    );
  }
}
