import 'package:flutter/material.dart';
import 'package:gocrm/resources/responsive.dart';
import 'package:gocrm/resources/theme.dart';

class Contact extends StatelessWidget {
  const Contact({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "Contact",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Whatever cardigan tote bag tumblr hexagon brooklyn asymmetrical gentrify.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(
            height: 30,
          ),
          Flex(
            direction: ResponsiveWidget.isSmallScreen(context)
                ? Axis.vertical
                : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name",
                      style: TextStyle(color: Colors.black.withOpacity(0.7))),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: ResponsiveWidget.isSmallScreen(context)
                        ? screenSize.width * 0.8
                        : screenSize.width * 0.2,
                    child: TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: cardetBlue.withOpacity(0.04),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: cardetBlue.withOpacity(0.2)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          )),
                    ),
                  )
                ],
              ),
              const SizedBox(width: 20, height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email",
                      style: TextStyle(color: Colors.black.withOpacity(0.7))),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: ResponsiveWidget.isSmallScreen(context)
                        ? screenSize.width * 0.8
                        : screenSize.width * 0.2,
                    child: TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: cardetBlue.withOpacity(0.04),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: cardetBlue.withOpacity(0.2)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          )),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Message",
                  style: TextStyle(color: Colors.black.withOpacity(0.7))),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: ResponsiveWidget.isSmallScreen(context)
                    ? screenSize.width * 0.8
                    : screenSize.width * 0.4 + 20,
                child: TextField(
                  minLines: 10,
                  maxLines: 15,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: cardetBlue.withOpacity(0.04),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: cardetBlue.withOpacity(0.2)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
