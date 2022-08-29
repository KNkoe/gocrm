import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gocrm/resources/responsive.dart';
import 'package:gocrm/resources/theme.dart';

class ContentBlock extends StatefulWidget {
  const ContentBlock(
      {Key? key,
      required this.screenSize,
      required this.icon,
      required this.title,
      required this.description,
      required this.iconColor,
      required this.backgroundColor})
      : super(key: key);

  final Size screenSize;
  final IconData icon;
  final String title;
  final String description;
  final Color iconColor;
  final Color backgroundColor;

  @override
  State<ContentBlock> createState() => _ContentBlockState();
}

class _ContentBlockState extends State<ContentBlock>
    with SingleTickerProviderStateMixin {
  bool hovered = false;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, -6),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.ease,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          hovered = true;
        });

        _controller.animateTo(0.01);
      },
      onExit: (value) {
        setState(() {
          hovered = false;
        });

        _controller.animateBack(0);
      },
      child: SlideTransition(
        position: _offsetAnimation,
        child: Container(
          width: ResponsiveWidget.isSmallScreen(context)
              ? widget.screenSize.width * 0.8
              : widget.screenSize.width * 0.25,
          height: 300,
          padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.all(20),
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              spreadRadius: -2,
              blurRadius: 12,
              color: Color.fromRGBO(0, 0, 0, 0.2),
            )
          ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                    color: hovered ? widget.iconColor : widget.backgroundColor,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: FaIcon(
                    widget.icon,
                    color: hovered ? Colors.white : widget.iconColor,
                    size: 36,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(widget.title, style: const TextStyle(fontSize: 20)),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.description,
                style: const TextStyle(color: Colors.black54),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.center,
        direction: ResponsiveWidget.isSmallScreen(context)
            ? Axis.vertical
            : Axis.horizontal,
        children: [
          ContentBlock(
            screenSize: screenSize,
            icon: FontAwesomeIcons.accessibleIcon,
            iconColor: porlandOrange,
            backgroundColor: lightGreen.withOpacity(0.2),
            title: "Quck Access",
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          ),
          ContentBlock(
            screenSize: screenSize,
            icon: FontAwesomeIcons.lock,
            iconColor: violetBlue,
            backgroundColor: porlandOrange.withOpacity(0.1),
            title: "Security",
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          ),
          ContentBlock(
            screenSize: screenSize,
            icon: FontAwesomeIcons.cloud,
            iconColor: goldenRod,
            backgroundColor: cardetBlue.withOpacity(0.2),
            title: "Cloud Storage",
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          )
        ],
      ),
    );
  }
}
