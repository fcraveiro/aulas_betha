import 'package:aulas_betha/pages/fernando/lib/size/size.dart';
import 'package:flutter/material.dart';

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({super.key});

  @override
  Widget build(BuildContext context) {
    Sizer size = Sizer.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Page'),
      ),
      body: Column(
        children: [
          Container(
            height: size.height(10),
            width: size.width(90),
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              'Container Azul',
              style: TextStyle(
                fontSize: size.fontSize(1),
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: size.height(20),
            width: size.width(90),
            color: Colors.green,
            alignment: Alignment.center,
            child: Text(
              'Container Azul',
              style: TextStyle(
                fontSize: size.fontSize(1),
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: size.height(20),
            width: size.width(90),
            color: Colors.teal,
            alignment: Alignment.center,
            child: Text(
              'Container Azul',
              style: TextStyle(
                fontSize: size.fontSize(1),
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: size.height(20),
            width: size.width(90),
            color: Colors.lightBlue,
            alignment: Alignment.center,
            child: Text(
              'Container Azul',
              style: TextStyle(
                fontSize: size.fontSize(1),
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: size.height(20),
            width: size.width(90),
            color: Colors.blueGrey,
            alignment: Alignment.center,
            child: Text(
              'Container Azul',
              style: TextStyle(
                fontSize: size.fontSize(1),
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: size.height(10),
            width: size.width(90),
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              'Container Azul',
              style: TextStyle(
                fontSize: size.fontSize(1),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
