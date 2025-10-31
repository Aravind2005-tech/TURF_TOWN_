import 'package:flutter/material.dart';
import 'package:TURF_TOWN_/src/CommonParameters/AppBackGround1/Appbg2.dart';
import 'package:TURF_TOWN_/src/viewmodels/buttons.dart';
import 'package:TURF_TOWN_/src/widgets/Circular_button.dart';
import 'package:TURF_TOWN_/src/widgets/score_buttons_row.dart';

class Board extends StatelessWidget {
  const Board({super.key});

  @override
  Widget build(BuildContext context) {
    return const BoardScreen();
  }
}

class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  bool _isExtrasMenuOpen = false;

  void _toggleExtrasMenu() =>
      setState(() => _isExtrasMenuOpen = !_isExtrasMenuOpen);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          /// ✅ Background
          Appbg2(),

          Column(
            children: [
              const SizedBox(height: 100),
              const Center(
                child: Text(
                  'Score Board',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),

              /// ✅ Top Score Info Card
              _buildInfoCard(
                size,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTeamStats(),
                    _buildScore(),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// ✅ Placeholder Section (Batsman / Overs)
              _buildInfoCard(size, height: 118),

              const SizedBox(height: 30),

              /// ✅ Balls Display Container
              Container(
                width: 350,
                height: 60,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF6E6679), Color(0xFF181719)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Center(
                  child: Text(
                    'Balls Display Here',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// ✅ Main Score Buttons Row
              ScoreButtonsRow(
                onScoreSelected: (value) {
                  print("Normal Run Pressed: $value");
                },
              ),

              const SizedBox(height: 20),

              /// ✅ Wicket Button
              Center(
                child: GradientCircleButton(
                  label: 'W',
                  onPressed: () => print('Pressed Wicket'),
                ),
              ),
            ],
          ),

          /// ✅ Dim overlay when extras menu is open
          if (_isExtrasMenuOpen)
            GestureDetector(
              onTap: _toggleExtrasMenu,
              child: Container(color: Colors.black.withOpacity(0.6)),
            ),

          /// ✅ Floating Extras Buttons
          _buildAnimatedRadialButton(
            label: 'Byes',
            left: 20,
            bottom: _isExtrasMenuOpen ? 180 : 20,
            visible: _isExtrasMenuOpen,
            onPressed: () {
              _toggleExtrasMenu();
              _showScorePopup(context, 'Byes');
            },
          ),
          _buildAnimatedRadialButton(
            label: 'Wide',
            left: _isExtrasMenuOpen ? 90 : 20,
            bottom: _isExtrasMenuOpen ? 100 : 20,
            visible: _isExtrasMenuOpen,
            onPressed: () {
              _toggleExtrasMenu();
              _showScorePopup(context, 'Wide');
            },
          ),
          _buildAnimatedRadialButton(
            label: 'No Ball',
            left: _isExtrasMenuOpen ? 160 : 20,
            bottom: 20,
            visible: _isExtrasMenuOpen,
            onPressed: () {
              _toggleExtrasMenu();
              _showScorePopup(context, 'No Ball');
            },
          ),

          /// ✅ Floating Main Buttons (Extras + Undo)
          Positioned(
            left: 20,
            bottom: 20,
            child: FloatingActionButton(
              onPressed: _toggleExtrasMenu,
              backgroundColor: Colors.white,
              shape: const CircleBorder(),
              child: const Text(
                'Extras',
                style: TextStyle(
                    color: Color(0xFF2A313B),
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: FloatingActionButton(
              onPressed: () => print('Undo pressed'),
              backgroundColor: Colors.white,
              shape: const CircleBorder(),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.undo, color: Color(0xFF2A313B), size: 20),
                  Text(
                    'Undo',
                    style: TextStyle(
                        color: Color(0xFF2A313B),
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ✅ Popup for Extras using same ScoreButtonsRow widget
  void _showScorePopup(BuildContext context, String label) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF2A313B),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Enter runs for $label',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 20),

                  /// ✅ Reused Score Buttons
                  ScoreButtonsRow(
                    onScoreSelected: (value) {
                      print("$label + $value runs");
                      Navigator.pop(context);
                    },
                  ),

                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Helper UI Widgets
  Widget _buildInfoCard(Size size, {Widget? child, double height = 87}) {
    return Center(
      child: Container(
        width: size.width * 0.9,
        height: height + 4,
        decoration: BoxDecoration(
          color: const Color(0xFF2A313B),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: child,
      ),
    );
  }

  Widget _buildTeamStats() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text('IND', style: TextStyle(color: Colors.white, fontSize: 22)),
        ),
        SizedBox(height: 4),
        Text('CRR : 300.00', style: TextStyle(color: Colors.white, fontSize: 12)),
        Text('NRR : 7.09', style: TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }

  Widget _buildScore() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: const [
        Text('120-3', style: TextStyle(color: Colors.white, fontSize: 22)),
        SizedBox(height: 2),
        Text('(12.3)', style: TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }

  Widget _buildAnimatedRadialButton({
    required String label,
    required double left,
    required double bottom,
    required bool visible,
    required VoidCallback onPressed,
  }) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      left: left,
      bottom: bottom,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: visible ? 1.0 : 0.0,
        child: Visibility(
          visible: visible,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(16),
            ),
            child: Text(
              label,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}
