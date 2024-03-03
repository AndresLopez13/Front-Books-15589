import 'package:flutter/material.dart';
import 'package:frontbooks/presentation/widgets/custom_drawer.dart';
import 'package:frontbooks/presentation/widgets/nav_bar.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final String title;

  const CustomScaffold({Key? key, required this.body, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
      drawer: MediaQuery.of(context).size.width <= 600
          ? const CustomDrawer()
          : null,
      body: body,
    );
  }
}
