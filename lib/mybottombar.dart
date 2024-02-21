library mybottombar;

import 'package:flutter/material.dart';

class MyBottomBar extends StatefulWidget {
  final List<NavBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Color? iconColor;
  final Color? labelColor;

   MyBottomBar({
    Key? key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.iconColor = Colors.blue,
    this.labelColor = Colors.blue,
  }) : super(key: key){
    if (items.length > 7) {
      throw ArgumentError('Number of items cannot exceed 7.');
    }
  }

  @override
  MyBottomBarState createState() => MyBottomBarState();
}

class MyBottomBarState extends State<MyBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: widget.items
          .map((item) => BottomNavigationBarItem(
        icon: Icon(item.icon),
        label: item.label?? " ",
      ))
          .toList(),
      currentIndex: widget.currentIndex,
      selectedItemColor: widget.iconColor,
      unselectedItemColor: Colors.grey,
      onTap: widget.onTap,
      selectedLabelStyle: TextStyle(color: widget.labelColor),
      unselectedLabelStyle:const TextStyle(color: Colors.grey),
    );
  }
}

class NavBarItem {
  final IconData icon;
  final String ?label;

  NavBarItem({
    required this.icon,
     this.label,
  });
}
