import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../CommonParameters/AppBackGround1/Appbg1.dart';
import '../views/ScoreCardPage.dart';

class Networkerror extends StatefulWidget {
  const Networkerror({super.key});

  @override
  State<Networkerror> createState() => _NetworkerrorState();
}

class _NetworkerrorState extends State<Networkerror> {
  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                SizedBox(height: 80),
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9).withValues(alpha: 0.22),

                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Image.asset(
                        'assets/images/networkerror.png',
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 1,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 43),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Center(
                    child: Text(
                      "OOPS! CONNECTION LOST Try again to enjoy the game",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Lottie.asset(
                    "assets/images/Glow loading.json",
                    height: 100,
                    width: 200,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
