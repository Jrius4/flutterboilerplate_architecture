import 'package:flutter/material.dart';
import 'package:flutter_primary_architecture/core/constants/constants.dart';
import 'package:flutter_primary_architecture/core/utils/designers.dart';
import 'package:flutter_primary_architecture/features/common/custom_widgets/custom_text.dart';

class CardDetails extends StatefulWidget {
  Map item;
  CardDetails({super.key, required this.item});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: 220,
            height: 150,
            child: Image.asset(
              widget.item['image'],
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white24, borderRadius: BorderRadius.circular(20)),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
              padding: const EdgeInsets.only(bottom: 28.0, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      CustomText(
                        textString: widget.item['name'],
                        textFontSize: 16,
                        textFontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              )),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                color: Constants.myCyanAccent,
                boxShadow: customShadow,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                  onPressed: () {},
                  color: primaryColor,
                  icon: Icon(widget.item['icon'])),
            ),
          ),
        ),
      ],
    );
  }
}
