import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import '../widgets/custom_drawer.dart';
import '../widgets/nav_bar.dart';

class PredictedClassesWidget extends StatelessWidget {
  final List<dynamic> predictedClasses;

  const PredictedClassesWidget({Key? key, required this.predictedClasses})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: predictedClasses
          .map((predictedClass) => Text(predictedClass.toString()))
          .toList(),
    );
  }
}


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
      // appBar: AppBar(title: const Text("Roses"),actions: [],),
      drawer: MediaQuery.of(context).size.width <= 600
          ? const CustomDrawer()
          : null,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Home Page'),
            SizedBox(height: 20),
                      ],
        ),
      ),
    );
  }
}
