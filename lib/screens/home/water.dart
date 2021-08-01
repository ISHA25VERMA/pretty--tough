import 'package:flutter/material.dart';

class WaterDrinking extends StatelessWidget {
  const WaterDrinking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drink enough water'),
      ),
      body: Center(
        child: Text(
          'Will be published soon !',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
