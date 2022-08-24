import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile(
      {Key? key,
      required bool isCollapsed,
      required String title,
      required IconData icon,
      required bool isSelected,
      hasChild = false})
      : _isCollapsed = isCollapsed,
        _title = title,
        _icon = icon,
        _isSelected = isSelected,
        _hasChild = hasChild,
        super(key: key);

  final bool _isCollapsed;
  final String _title;
  final IconData _icon;
  final bool _isSelected;
  final bool _hasChild;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _isSelected ? Colors.black.withOpacity(0.2) : Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Icon(
              _icon,
              color: Colors.white,
              size: 28,
            ),
            if (_isCollapsed)
              const SizedBox(
                width: 20,
              ),
            if (_isCollapsed)
              Text(
                _title,
                style: const TextStyle(color: Colors.white70),
              ),
            const SizedBox(
              width: 10,
            ),
            if (_hasChild && _isCollapsed)
              const Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
                size: 18,
              )
          ],
        ),
      ),
    );
  }
}
