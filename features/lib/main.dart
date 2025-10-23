import 'package:flutter/material.dart';
import 'package:turf_scorer/Sliding_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
void main() {
  runApp(const SlidingPageApp());
}

class SlidingPageApp extends StatelessWidget {
  const SlidingPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SlidingPage(),
    );
  }
}

