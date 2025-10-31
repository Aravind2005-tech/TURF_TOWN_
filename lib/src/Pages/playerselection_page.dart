import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../CommonParameters/AppBackGround1/Appbg1.dart';
import '../views/ScoreCardPage.dart';

class SelectPlayersPage extends StatefulWidget {
  @override
  _SelectPlayersPageState createState() => _SelectPlayersPageState();
}

class _SelectPlayersPageState extends State<SelectPlayersPage> {
  String? selectedStriker;
  String? selectedNonStriker;
  String? selectedBowler;

  List<String> players = [
    'Player 1',
    'Player 2',
    'Player 3',
    'Player 4',
    'Player 5',
  ];

  List<String> bowlers = ['Bowler 1', 'Bowler 2', 'Bowler 3'];

  @override
  Widget build(BuildContext context) {
    // screenHeight was unused and removed to avoid analyzer warning

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(gradient: Appbg1.mainGradient),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.menu),
                            color: Colors.white,
                            iconSize: 30.0,
                            tooltip: 'Menu',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Board(),
                                ),
                              );
                            },
                          ),
                          Text(
                            'Cricket',
                            style: TextStyle(fontSize: 35, color: Colors.white),
                          ),
                          SizedBox(width: 5),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              'Scorer',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: SvgPicture.asset(
                              'assets/images/ix_support.svg',
                              width: 30,
                              height: 30,
                              // use colorFilter for flutter_svg v2 to tint the SVG
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                              placeholderBuilder:
                                  (context) => const Icon(
                                    Icons.headset,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                            ),
                            color: Colors.white,
                            iconSize: 30.0,
                            tooltip: 'Audio',
                            onPressed: () {
                              // Handle headphone icon press
                            },
                          ),
                          IconButton(
                            icon: Image.asset(
                              'assets/images/setting_icon.png',
                              width: 26,
                              height: 26,
                              fit: BoxFit.contain,
                            ),
                            color: Colors.white,
                            iconSize: 30.0,
                            tooltip: 'Settings',
                            onPressed: () {
                              // Handle settings icon press
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C2026),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Back arrow + title
                      Row(
                        children: [
                          const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: const Text(
                              "Select Opening Players",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Striker
                            const Text(
                              "Striker",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 15),
                            _buildDropdown(
                              hint: "Select Striker",
                              value: selectedStriker,
                              items: players,
                              onChanged: (value) {
                                setState(() => selectedStriker = value);
                              },
                            ),

                            const SizedBox(height: 20),

                            // Non-Striker
                            const Text(
                              "Non-Striker",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 15),
                            _buildDropdown(
                              hint: "Select Non-Striker",
                              value: selectedNonStriker,
                              items: players,
                              onChanged: (value) {
                                setState(() => selectedNonStriker = value);
                              },
                            ),

                            const SizedBox(height: 20),

                            // Bowler
                            const Text(
                              "Bowler",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 15),
                            _buildDropdown(
                              hint: "Choose Bowler",
                              value: selectedBowler,
                              items: bowlers,
                              onChanged: (value) {
                                setState(() => selectedBowler = value);
                              },
                            ),

                            const SizedBox(height: 57),

                            // Proceed Button
                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF0E7292),
                                  minimumSize: const Size(50, 50),
                                  maximumSize: const Size(150, 50),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () {
                                  // Proceed logic
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Proceeding to match..."),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: const Text(
                                        "Proceed",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    // sized image won't cause overflow
                                    Image.asset(
                                      'assets/images/mdi_cricket.png',
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.contain,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
      height: 44.23,

      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: Color(0xFFD9D9D9),

          borderRadius: BorderRadius.circular(20),
          value: value,
          hint: Text(
            hint,
            style: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 14),
          ),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
            size: 20,
          ),
          isExpanded: true,
          isDense: true,
          items:
              items
                  .map(
                    (player) => DropdownMenuItem<String>(
                      value: player,
                      child: Text(
                        player,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                  .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
