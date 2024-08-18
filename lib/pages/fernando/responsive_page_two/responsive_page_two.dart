import 'dart:developer';

import 'package:flutter/material.dart';

class ResponsivePageTwo extends StatelessWidget {
  const ResponsivePageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final view = View.of(context);
    final mediaQueryData = MediaQueryData.fromView(view);
    // log('MediaQueryData.fromView: $mediaQueryData');

    log(mediaQueryData.viewPadding.toString());
    log(mediaQueryData.accessibleNavigation.toString());
    log(mediaQueryData.devicePixelRatio.toString());
    log(mediaQueryData.navigationMode.toString());
    log(mediaQueryData.padding.toString());
    log(mediaQueryData.size.toString());

    final appBar = AppBar(title: const Text('AppBar Example'));

    final screenHeight = mediaQuery.size.height;
    final appBarHeight = appBar.preferredSize.height;
    final statusBarHeight = mediaQuery.padding.top;
    final usableHeight = screenHeight - appBarHeight - statusBarHeight;

    return Scaffold(
      // appBar: appBar,
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: (usableHeight * 20) / 100,
                color: Colors.blue,
              ),
              Container(
                width: double.infinity,
                height: (usableHeight / 5),
                color: Colors.green,
              ),
              Container(
                width: double.infinity,
                height: (usableHeight / 5),
                color: Colors.teal,
              ),
              Container(
                width: double.infinity,
                height: (usableHeight / 5),
                color: Colors.cyan,
              ),
              Container(
                width: double.infinity,
                height: (usableHeight / 5),
                color: Colors.red,
              ),
              // Text('Screen height: $screenHeight'),
              // Text('AppBar height: $appBarHeight'),
              // Text('Status bar height: $statusBarHeight'),
              // Text('Usable height: $usableHeight'),
            ],
          ),
        ),
      ),
    );
  }
}
