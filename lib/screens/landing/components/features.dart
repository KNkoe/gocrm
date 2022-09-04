import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class FeatureMenuItem extends StatefulWidget {
  FeatureMenuItem(this.isHovered, this.title, this.icon, this.description,
      {Key? key})
      : super(key: key);

  bool isHovered;
  final String title;
  final String description;
  final IconData icon;

  @override
  State<FeatureMenuItem> createState() => _FeatureMenuItemState();
}

class _FeatureMenuItemState extends State<FeatureMenuItem> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          widget.isHovered = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.06)),
            color: widget.isHovered
                ? Theme.of(context).primaryColor.withOpacity(0.2)
                : Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        width: screenSize.width * 0.2,
        child: Column(
          children: [
            Row(
              children: [
                FaIcon(
                  widget.icon,
                  size: 12,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(widget.description,
                style: const TextStyle(color: Colors.black54))
          ],
        ),
      ),
    );
  }
}

class Features extends StatelessWidget {
  const Features({
    Key? key,
    required List<bool> isHovered,
  })  : _isHovered = isHovered,
        super(key: key);

  final List<bool> _isHovered;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          offset: Offset(3, 3),
          spreadRadius: -7,
          blurRadius: 17,
          color: Color.fromRGBO(0, 0, 0, 0.5),
        )
      ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  //Appointment
                  FeatureMenuItem(
                      _isHovered[0],
                      "Appointment",
                      FontAwesomeIcons.solidCalendar,
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
                  const SizedBox(
                    height: 20,
                  ),
                  //Website Builder
                  FeatureMenuItem(
                      _isHovered[1],
                      "Website builder",
                      FontAwesomeIcons.spider,
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
                ],
              ),
              Column(
                children: [
                  //Schedule
                  FeatureMenuItem(
                      _isHovered[2],
                      "Schedule",
                      FontAwesomeIcons.calendar,
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
                  const SizedBox(
                    height: 20,
                  ),
                  //Invoice
                  FeatureMenuItem(
                      _isHovered[3],
                      "Invoice",
                      FontAwesomeIcons.fileInvoice,
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                ],
              ),
              Column(
                children: [
                  //Online meetings
                  FeatureMenuItem(
                      _isHovered[4],
                      "Online meetings",
                      FontAwesomeIcons.meetup,
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
                  const SizedBox(
                    height: 20,
                  ),
                  //Google My Business
                  FeatureMenuItem(
                      _isHovered[5],
                      "Google My Business",
                      FontAwesomeIcons.googleWallet,
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
