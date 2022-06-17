import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:portfolio/screens/widgets/blinkingarrow.dart';

import '../provider/user_provider.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer(builder: (context, ref, _) {
          final user = ref.watch(userProvider);
          return SafeArea(
            child: user.when(
              data: (data) => Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 8.5,
                    child: Marquee(
                      text: user.value!.name + ' ',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                      scrollAxis: Axis.horizontal,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 8.5,
                    child: Marquee(
                      text: user.value!.name + ' ',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                      scrollAxis: Axis.horizontal,
                      startAfter: const Duration(milliseconds: 500),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 8.5,
                    child: Marquee(
                      text: user.value!.name + ' ',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                      scrollAxis: Axis.horizontal,
                      startAfter: const Duration(milliseconds: 1000),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 8.5,
                    child: Marquee(
                      text: user.value!.name + ' ',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                      scrollAxis: Axis.horizontal,
                      startAfter: const Duration(milliseconds: 1500),
                    ),
                  ),
                ],
              ),
              error: (err, stackTracea) => Text('Error: $err'),
              loading: () => const CircularProgressIndicator(),
            ),
          );
        }),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Text('Portfolio V1',
                style: GoogleFonts.lora(
                    textStyle: const TextStyle(fontStyle: FontStyle.italic),
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w400)

                // TextStyle(color: Colors.white, fontSize: 50),
                ),
          ),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Swipe Up',
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: BlinkingArrow(),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
