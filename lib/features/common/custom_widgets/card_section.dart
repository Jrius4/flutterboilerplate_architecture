import 'package:flutter/material.dart';
import 'package:flutter_primary_architecture/core/utils/designers.dart';
import 'package:flutter_primary_architecture/features/common/custom_widgets/custom_text.dart';

class CardSection extends StatelessWidget {
  const CardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          alignment: Alignment.topLeft,
          child: CustomText(
            textString: 'Most recent Parcels',
            textFontSize: 20,
            textFontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            padding: EdgeInsets.all(2),
            scrollDirection: Axis.horizontal,
            itemBuilder: (cxt, i) {
              return Container(
                width: MediaQuery.of(context).size.width * .828,
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 40),
                decoration: BoxDecoration(
                    boxShadow: customShadow,
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(children: [
                  Positioned.fill(
                    top: 150,
                    bottom: -200,
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: customShadow,
                          color: Colors.white38,
                          shape: BoxShape.circle),
                    ),
                  ),
                  Positioned.fill(
                    left: -300,
                    top: -100,
                    bottom: -100,
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: customShadow,
                          color: Colors.white38,
                          shape: BoxShape.circle),
                    ),
                  ),
                  // CardDetails(),
                ]),
              );
            },
          ),
        )
      ],
    );
  }
}
