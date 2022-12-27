import 'package:flutter/material.dart';

class main_appbar extends StatelessWidget {
  const main_appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [Text("", style: TextStyle(color: Colors.black))],
      ),
      backgroundColor: Colors.black.withOpacity(0),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        IconButton(icon: Icon(Icons.home_filled), onPressed: () => {}),
        IconButton(
            icon: Icon(Icons.shopping_cart_outlined), onPressed: () => {}),
      ],
    );
  }

  Widget g() {
    return AppBar();
  }
}

class wrap_appbar extends StatelessWidget {
  const wrap_appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class only_home_appbar extends StatelessWidget {
  const only_home_appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
