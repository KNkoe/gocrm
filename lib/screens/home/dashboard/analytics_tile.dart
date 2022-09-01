import 'package:flutter/material.dart';

import '../../../resources/theme.dart';

class AnalyticsTile extends StatelessWidget {
  const AnalyticsTile({Key? key, required this.screenSize, required title})
      : _title = title,
        super(key: key);

  final Size screenSize;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: screenSize.height * 0.4,
      width: screenSize.width * 0.25,
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              spreadRadius: -2,
              blurRadius: 12,
              color: Color.fromRGBO(0, 0, 0, 0.2),
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 4, color: cardetBlue.withOpacity(0.03)))),
            height: 60,
            child: Text(
              _title,
              style: const TextStyle(fontSize: 18, color: Colors.black54),
            ),
          ),
          Column(
            children: const [
              Icon(
                Icons.bar_chart,
                size: 60,
                color: Colors.black26,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "No Record Found",
                style: TextStyle(fontSize: 18, color: Colors.black26),
              )
            ],
          ),
          const SizedBox()
        ],
      ),
    );
  }
}
