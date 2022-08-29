import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gocrm/screens/landing/components/contact.dart';
import 'package:gocrm/screens/landing/components/content.dart';
import 'package:gocrm/screens/landing/components/features.dart';
import 'package:gocrm/screens/landing/components/footer.dart';
import 'package:gocrm/screens/landing/components/images.dart';
import 'package:gocrm/resources/responsive.dart';
import 'package:gocrm/resources/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  final List<bool> _isHovered = [false, false, false, false, false, false];
  final List _isHovering = [false, false, false, false];

  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.05
        ? _scrollPosition / (screenSize.height)
        : 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor:
                  Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
              elevation: 0,
              centerTitle: true,
              title: Text(
                'GOCRM',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: Theme.of(context)
                        .bottomAppBarColor
                        .withOpacity(_opacity),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.popAndPushNamed(context, '/');
                            },
                            child: Row(
                              children: [
                                const Image(
                                  height: 30,
                                  image: AssetImage("images/go.png"),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'GOCRM',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily:
                                        GoogleFonts.montserrat().fontFamily,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    SchedulerBinding.instance
                                        .addPostFrameCallback((_) {
                                      _scrollController.animateTo(
                                          _scrollController
                                              .position.minScrollExtent,
                                          duration: const Duration(seconds: 1),
                                          curve: Curves.easeIn);
                                    });
                                  },
                                  onHover: (value) {
                                    setState(() {
                                      _isHovering[0] = value;
                                    });
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Home',
                                        style: TextStyle(
                                          color: _isHovering[0]
                                              ? Colors.blue.shade200
                                              : Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Visibility(
                                        maintainAnimation: true,
                                        maintainState: true,
                                        maintainSize: true,
                                        visible: _isHovering[0],
                                        child: Container(
                                          height: 2,
                                          width: 20,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: screenSize.width / 20),
                                InkWell(
                                  onTap: () {},
                                  onHover: (value) {
                                    setState(() {
                                      _isHovering[1] = value;
                                      hovered = true;
                                    });
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Features',
                                        style: TextStyle(
                                          color: _isHovering[1]
                                              ? Colors.blue.shade200
                                              : Colors.white,
                                        ),
                                      ),
                                      Visibility(
                                          maintainAnimation: true,
                                          maintainState: true,
                                          maintainSize: true,
                                          visible: !_isHovering[1],
                                          child: const FaIcon(
                                            FontAwesomeIcons.angleDown,
                                            color: Colors.white,
                                            size: 10,
                                          ))
                                    ],
                                  ),
                                ),
                                SizedBox(width: screenSize.width / 20),
                                InkWell(
                                  onTap: () {
                                    SchedulerBinding.instance
                                        .addPostFrameCallback((_) {
                                      _scrollController.animateTo(
                                          _scrollController
                                              .position.maxScrollExtent,
                                          duration: const Duration(seconds: 1),
                                          curve: Curves.easeIn);
                                    });
                                  },
                                  onHover: (value) {
                                    setState(() {
                                      _isHovering[2] = value;
                                    });
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Contact',
                                        style: TextStyle(
                                          color: _isHovering[2]
                                              ? Colors.blue.shade200
                                              : Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Visibility(
                                        maintainAnimation: true,
                                        maintainState: true,
                                        maintainSize: true,
                                        visible: _isHovering[2],
                                        child: Container(
                                          height: 2,
                                          width: 20,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(oceanGreen),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.all(20))),
                                onPressed: () {
                                  Navigator.popAndPushNamed(context, '/signup');
                                },
                                child: const Text(
                                  'Sign up for free',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              OutlinedButton(
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.all(20))),
                                onPressed: () {
                                  Navigator.popAndPushNamed(context, '/login');
                                },
                                onHover: (value) {
                                  setState(() {
                                    _isHovering[3] = value;
                                  });
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: _isHovering[3]
                                        ? Colors.white
                                        : Colors.white70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  hovered
                      ? InkWell(
                          onTap: () {},
                          onHover: (value) {
                            setState(() {
                              hovered = value;
                            });
                          },
                          child: Features(isHovered: _isHovered),
                        )
                      : Container(),
                ],
              )),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          child: Stack(
            children: [
              Column(
                children: [
                  BackgroundImage(screenSize: screenSize),
                  if (ResponsiveWidget.isSmallScreen(context))
                    CoverImage(width: screenSize.width),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                            height: screenSize.height * 0.3,
                            width: ResponsiveWidget.isSmallScreen(context)
                                ? screenSize.width
                                : screenSize.width * 0.4,
                            child: Text(
                              "Everything you need to run and grow your business in one place: Payment collection, billing, scheduling, client management, and email & SMS marketing.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black54,
                                  fontFamily: GoogleFonts.ubuntu().fontFamily),
                            ),
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(porlandOrange),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(20))),
                              onPressed: () {
                                Navigator.popAndPushNamed(context, '/signup');
                              },
                              child: const Text("Download"))
                        ],
                      ),
                      const SizedBox()
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height * 0.1,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration:
                        BoxDecoration(color: cardetBlue.withOpacity(0.03)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenSize.height * 0.05,
                        ),
                        const Text("GOCRM Features",
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: screenSize.width * 0.4,
                          child: const Text(
                            "We help Startups and enterprises manage their sales and support with few clicks. Everying is simple and straight.",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Content(screenSize: screenSize)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.1,
                  ),
                  Contact(screenSize: screenSize),
                  SizedBox(
                    height: screenSize.height * 0.1,
                  ),
                  Footer(screenSize: screenSize)
                ],
              ),
              ResponsiveWidget.isSmallScreen(context)
                  ? Container()
                  : CoverImage(width: screenSize.width * 0.5),
            ],
          ),
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
