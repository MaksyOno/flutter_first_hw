// Flutter imports:
// ignore_for_file: unused_import

import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:import_sorter/args.dart';
import 'package:import_sorter/files.dart';
import 'package:import_sorter/sort.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter first hw',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Local and web svg`s'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          text('Local SVG'),
          sizedBox(20),
          localSvg,
          sizedBox(50),
          text('Web SVG'),
          sizedBox(20),
          webSvg,
        ],
      )),
    );
  }
}

Text text(String a) {
  return Text(a);
}

SizedBox sizedBox(double b) {
  return SizedBox(
    height: b,
  );
}

final Widget localSvg = SizedBox(
  height: 100,
  width: 100,
  child: SvgPicture.asset('assets/images/tiger.svg'),
);

final Widget webSvg = SizedBox(
  height: 100,
  width: 100,
  child: SvgPicture.network('https://svgsilh.com/svg/1531577.svg'),
);
