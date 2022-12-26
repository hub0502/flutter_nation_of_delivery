import 'package:flutter/material.dart';

class Shops extends StatelessWidget {
  const Shops({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text('go home'),
        onPressed: () => {Navigator.pushNamed(context, '/')},
      ),
    );
  }
}
