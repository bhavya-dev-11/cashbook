import 'package:flutter/material.dart';

class Homeshell extends StatefulWidget {
  const Homeshell({super.key});

  @override
  State<Homeshell> createState() => _HomeshellState();
}

class _HomeshellState extends State<Homeshell> {

  int currentIndex = 0;

  void _onNavTap(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}