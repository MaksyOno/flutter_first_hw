// Flutter imports:
// ignore_for_file: unused_import

import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
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
      home: const MyHomePage(title: 'Carousel'),
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
          child: CarouselSlider(
        options: CarouselOptions(height: 300.0),
        items: [localSvg, webSvg].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: (i),
              );
            },
          );
        }).toList(),
      )),
    );
  }
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
