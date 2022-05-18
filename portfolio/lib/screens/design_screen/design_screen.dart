import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../provider/design_provider.dart';

class DesignScreen extends StatelessWidget {
  const DesignScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final designs = ref.watch(designProvider);
      return SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text('Designs Portfolio',
                    style: GoogleFonts.lora(
                        textStyle: const TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontSize: 24))),
              ),
              const SizedBox(
                height: 24,
              ),
              designs.when(
                data: (data) {
                  // print(data[0]);
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(360)),
                            height: 100,
                            padding: const EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(data[index].imageUrl)),
                        const SizedBox(
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text('Theme: ${data[index].theme}',
                              style: GoogleFonts.lora(
                                  textStyle: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white,
                                      fontSize: 18))),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: ListView.builder(
                              itemCount: data[index].screenUrls.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index2) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                            data[index].screenUrls[index2])),
                                    const SizedBox(
                                      width: 50,
                                    )
                                  ]),
                                );
                              }),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  );
                },
                error: (err, stackTracea) => Text('Error: $err'),
                loading: () => const CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      );
    });
  }
}
