import 'package:flutter/material.dart';
import 'alerts_page.dart'; // Import your AlertsPage

void main() {
  runApp(const CricketScorerApp());
}

class CricketScorerApp extends StatelessWidget {
  const CricketScorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cricket Scorer',
      theme: ThemeData(
        primaryColor: const Color(0xFF050036),
        scaffoldBackgroundColor: const Color(0xFF050036),
        useMaterial3: false,
      ),
      home: const AlertsPage(), // 👈 Starting page (you can change later)
    );
  }
}
