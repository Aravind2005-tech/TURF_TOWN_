import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Advancedvsettings extends StatelessWidget {
  const Advancedvsettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 800,
          child: Stack(
            children: [
              // 🔹 Background Gradient
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.5, 0.0),
                      end: Alignment(0.5, 0.9),
                      colors: [Color(0xFF140088), Colors.black],
                    ),
                  ),
                ),
              ),

              // 🔹 SVG Icons from assets
              Positioned(
                left: 20,
                top: 20,
                child: SvgPicture.asset(
                  'assets/apple.svg',
                  width: 40,
                  height: 40,
                  color: Colors.white,
                ),
              ),
              Positioned(
                left: 80,
                top: 20,
                child: SvgPicture.asset(
                  'assets/Group-1.svg',
                  width: 40,
                  height: 40,
                  color: Colors.white,
                ),
              ),
              Positioned(
                right: 20,
                top: 20,
                child: SvgPicture.asset(
                  'assets/ix_support.svg',
                  width: 40,
                  height: 40,
                  color: Colors.white,
                ),
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: SvgPicture.asset(
                  'assets/picon_on.svg',
                  width: 50,
                  height: 50,
                  color: Colors.greenAccent,
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: SvgPicture.asset(
                  'assets/Rectangle 4.svg',
                  width: 60,
                  height: 60,
                ),
              ),

              // 🔹 Header Text
              const Positioned(
                left: 10,
                top: 100,
                child: SizedBox(
                  width: 222,
                  height: 49,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Cricket ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Scorer',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // 🔹 Example card for settings section
              Positioned(
                left: 30,
                top: 200,
                child: Container(
                  width: 300,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: const Center(
                    child: Text(
                      'Match Settings Placeholder',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ),

              // 🔹 Save Button
              Positioned(
                bottom: 80,
                left: 90,
                right: 90,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Settings Saved!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF19005D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Save Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
