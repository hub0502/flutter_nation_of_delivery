import 'package:flutter/material.dart';
import 'package:flutter_nation_of_delivery/pages/WidgetPage.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(
            child: Text('asd'),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.widgets),
                onPressed: () => {Navigator.pushNamed(context, '/widgets')}),
            IconButton(
                icon: Icon(Icons.notifications_none), onPressed: () => {}),
            IconButton(icon: Icon(Icons.person), onPressed: () => {}),
          ],
          bottom: AppBar(
              title: TextFormField(
                  decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            fillColor: Colors.white,
            filled: true,
            hintText: '배고프니까 일단 검색!!',
          )))),
    );
  }
}
