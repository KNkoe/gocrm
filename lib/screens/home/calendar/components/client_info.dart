import 'package:flutter/material.dart';

class ClientInfo extends StatelessWidget {
  const ClientInfo({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: screenSize.height * 0.4,
      decoration: BoxDecoration(border: Border.all(color: Colors.grey[500]!)),
      width: screenSize.width * 0.3,
      child: Column(
        children: [
          const Text(
            "Client & contact info",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              CircleAvatar(
                child: Icon(
                  Icons.person,
                  color: Colors.grey[500],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("Johnny")
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: Colors.grey[300]!),
                  bottom: BorderSide(color: Colors.grey[300]!)),
            ),
            child: Row(
              children: [
                Text(
                  "Email : ",
                  style: TextStyle(color: Colors.grey[700]!),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text("Johnnypmoser@gmail.com")
              ],
            ),
          )
        ],
      ),
    );
  }
}
