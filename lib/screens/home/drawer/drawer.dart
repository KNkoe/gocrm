import 'package:flutter/material.dart';

import '../../../resources/theme.dart';
import 'drawer_tile.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    Key? key,
    required this.screenSize,
    required bool isCollapsed,
  })  : _isCollapsed = isCollapsed,
        super(key: key);

  final Size screenSize;
  final bool _isCollapsed;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final List<bool> _isSelected = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  select(int index) {
    for (int i = 0; i < _isSelected.length; i++) {
      if (i != index) {
        _isSelected[i] = false;
      }
    }
    _isSelected[index] = true;

    for (int i = 0; i < _showChildren.length; i++) {
      _showChildren[i] = false;
    }
  }

  final List<bool> _showChildren = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      decoration: const BoxDecoration(
          color: cardetBlue,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(6), bottomRight: Radius.circular(6)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              spreadRadius: -2,
              blurRadius: 8,
              color: Color.fromRGBO(0, 0, 0, 0.4),
            )
          ]),
      height: widget.screenSize.height * 0.9,
      width: widget._isCollapsed ? widget.screenSize.width * 0.15 : 60,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  select(0);
                });
              },
              child: DrawerTile(
                isCollapsed: widget._isCollapsed,
                title: "Dashboard",
                icon: Icons.dashboard,
                isSelected: _isSelected[0],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  select(1);
                });
              },
              child: DrawerTile(
                isCollapsed: widget._isCollapsed,
                title: "Calender",
                icon: Icons.edit_calendar_outlined,
                isSelected: _isSelected[1],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  select(2);
                });
              },
              child: DrawerTile(
                isCollapsed: widget._isCollapsed,
                title: "Clients",
                icon: Icons.contact_page,
                isSelected: _isSelected[2],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  select(4);
                  _showChildren[0] = true;
                });
              },
              child: Column(
                children: [
                  DrawerTile(
                    isCollapsed: widget._isCollapsed,
                    title: "Billing",
                    icon: Icons.payments,
                    isSelected: _isSelected[4],
                    hasChild: true,
                  ),
                  if (_showChildren[0])
                    Container(
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.4)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (widget._isCollapsed)
                            const SizedBox(
                              width: 30,
                            ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    select(5);
                                  });
                                  _showChildren[0] = true;
                                },
                                child: DrawerTile(
                                  isCollapsed: widget._isCollapsed,
                                  title: "Invoice",
                                  icon: Icons.document_scanner,
                                  isSelected: _isSelected[5],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    select(6);
                                    _showChildren[0] = true;
                                  });
                                },
                                child: DrawerTile(
                                  isCollapsed: widget._isCollapsed,
                                  title: "Payments",
                                  icon: Icons.payment,
                                  isSelected: _isSelected[6],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  select(7);
                });
              },
              child: DrawerTile(
                isCollapsed: widget._isCollapsed,
                title: "Meetings",
                icon: Icons.meeting_room,
                isSelected: _isSelected[7],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  select(8);
                });
              },
              child: DrawerTile(
                isCollapsed: widget._isCollapsed,
                title: "Webite Builer",
                icon: Icons.web,
                isSelected: _isSelected[8],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  select(9);
                });
              },
              child: DrawerTile(
                isCollapsed: widget._isCollapsed,
                title: "Forum",
                icon: Icons.forum,
                isSelected: _isSelected[9],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
