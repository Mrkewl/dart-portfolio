import 'package:flutter/material.dart';

class CardSectionDots extends StatelessWidget {
  const CardSectionDots(
      {Key? key, required this.dotNumber, required this.itemCount})
      : super(key: key);
  final int dotNumber;
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 10,
              width: dotNumber == index ? 30 : 10,
              decoration: BoxDecoration(
                  color: dotNumber == index ? Colors.white : Colors.grey,
                  borderRadius: BorderRadius.circular(360)),
            ),
          );
        });
  }
}
