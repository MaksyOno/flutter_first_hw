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
        children: const <Widget>[
          ImageSourceText(text: 'Local SVG'),
          MySizeBox(height: 20.0),
          localSvg,
          MySizeBox(height: 50.0),
          ImageSourceText(text: 'Web SVG'),
          MySizeBox(height: 20.0),
          webSvg
        ],
      )),
    );
  }
}

Text text(String a) {
  return Text(a);
}

class ImageSourceText extends StatelessWidget {
  const ImageSourceText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}

class MySizeBox extends StatelessWidget {
  const MySizeBox({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class TypeOfImage extends StatelessWidget {
  const TypeOfImage({
    Key? key,
    required this.type,
    required this.asset,
  }) : super(key: key);

  final String type;
  final String asset;

  @override
  Widget build(BuildContext context) {
    if (type == 'local') {
      return SizedBox(
        height: 100.0,
        width: 100.0,
        child: SvgPicture.asset(asset),
      );
    } else {
      return SizedBox(
        height: 100.0,
        width: 100.0,
        child: SvgPicture.network(asset),
      );
    }
  }
}

const localSvg = TypeOfImage(type: 'local', asset: 'assets/images/tiger.svg');
const webSvg = TypeOfImage(type: 'web', asset: 'https://svgsilh.com/svg/1531577.svg');
