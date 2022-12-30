import 'package:flutter/material.dart';

class MainAppbarDesign extends StatelessWidget implements PreferredSizeWidget {
  List<Widget> actionButtons;
  String titleText;
  bool titleCenter;

  MainAppbarDesign(
      {required this.titleCenter,
      required this.titleText,
      required this.actionButtons});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        titleText,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      actions: actionButtons,
    );
  }
}
