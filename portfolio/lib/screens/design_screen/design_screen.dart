import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/provider/screenui_providers.dart';
import 'package:portfolio/screens/project_screen/project_detail_screen.dart';
import 'package:portfolio/screens/widgets/cardSectionDots.dart';

import '../../provider/design_provider.dart';

class DesignScreen extends StatelessWidget {
  const DesignScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final designs = ref.watch(designProvider);
      return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 24,
            ),
            Center(
              child: Text('Designs Portfolio',
                  style: GoogleFonts.lora(
                      textStyle: const TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                          fontSize: 24))),
            ),
            designs.when(
              data: (data) {
                // print(data[0]);
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: ListView.builder(
                    itemCount: data.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        Image.network(data[index].imageUrl),
                  ),
                );
              },
              error: (err, stackTracea) => Text('Error: $err'),
              loading: () => const CircularProgressIndicator(),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      );
    });
  }
}
