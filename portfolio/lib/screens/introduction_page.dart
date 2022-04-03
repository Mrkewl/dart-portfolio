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
          return ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) => SizedBox(
              height: MediaQuery.of(context).size.height / 9.5,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: user.when(
                    data: (data) => Marquee(
                      text: user.value!.name,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                      scrollAxis: Axis.horizontal,
                    ),
                    error: (err, stackTracea) => Text('Error: $err'),
                    loading: () => const CircularProgressIndicator(),
                  )),
            ),
          );
        }),
        const Align(
          alignment: Alignment.topRight,
          child: Text(
            'PortFolio',
            style: TextStyle(color: Colors.white, fontSize: 50),
          ),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Swipe Up',
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16),
                child: BlinkingArrow(),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
