import 'package:flutter/material.dart';

import 'package:prueba/views/widgets/header_widget.dart';
import 'package:prueba/views/widgets/widget_concepto.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
             HeaderWidget(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           // WeatherScreen(),
             Concepto(),
          ],
        ),
      ],
    );
  }
}
