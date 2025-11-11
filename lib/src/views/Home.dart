import 'package:TURF_TOWN_/src/Pages/Phone_no.dart';
import 'package:TURF_TOWN_/src/Pages/privacy.dart';
import 'package:TURF_TOWN_/src/views/Venue.dart';
import 'package:flutter/material.dart';
import 'package:TURF_TOWN_/src/CommonParameters/AppBackGround1/Appbg1.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:TURF_TOWN_/src/views/ScoreCard.dart';
import 'package:TURF_TOWN_/src/viewmodels/ScoreController.dart';
import 'package:TURF_TOWN_/src/widgets/Navigation_bar.dart';
import 'package:TURF_TOWN_/src/Pages/setting.dart';
import 'package:TURF_TOWN_/src/Pages/account.dart';
import 'package:TURF_TOWN_/src/Pages/team_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedIndex = 2;

  final List<Widget> _pages = [
    CricketScorerHeader(),
    PhoneNumberPage(),
    const HomeContent(),
    PrivacyScreen(),
    SettingsScreen(),
  ];

  void _handleNavTap(int index) {
    if (_selectedIndex == index) return;
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Navigation_bar(
        currentIndex: _selectedIndex,
        onTap: _handleNavTap,
      ),
      body: _pages[_selectedIndex],
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(gradient: Appbg1.mainGradient),
        ),
        Positioned.fill(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(height: 800),

                  /// Location and Icons Row
                  Positioned(
                    top: 50,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.location_on,
                                color: Colors.white, size: 24),
                            const SizedBox(width: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Your Location",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.4),
                                    fontSize: 10,
                                  ),
                                ),
                                const Text(
                                  "Periya Muthali...",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon:
                              const Icon(Icons.person, color: Colors.white),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfileScreen(),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.settings,
                                  color: Colors.white),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SettingsScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// Search Bar
                  Positioned(
                    top: 120,
                    left: 20,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF545454),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.search,
                            color: Colors.white.withOpacity(0.7),
                          ),
                          hintText: "Search...",
                          hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.7)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                  /// Sports Slider
                  Positioned(
                    top: 200,
                    left: 20,
                    right: 20,
                    height: 160,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TeamPage(),
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(15.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset(
                                'assets/images/cri_slider.png',
                                width: 140,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(15.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset(
                                'assets/images/foot_slider.png',
                                width: 140,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(15.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset(
                                'assets/images/badminton_slider.png',
                                width: 140,
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// Book Venue Header
                  Positioned(
                    top: 370,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Book a nearby Venue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 80),
                        // GestureDetector(
                        //   onTap: () {
                        //     // Add your function or navigation code here
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => CricketScorerHeader(),
                        //         ),
                        //       );
                        //     print("See All tapped!");
                        //   },
                        //   child: Text(
                        //     "See All",
                        //     style: TextStyle(
                        //       color: Colors.white.withOpacity(0.7),
                        //       fontSize: 18,
                        //     ),
                        //   ),
                        // )

                      ],
                    ),
                  ),

                  /// Venue Slider
                  Positioned(
                    top: 410,
                    left: 20,
                    right: 20,
                    height: 85,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              'assets/images/cricket_ground_1.png.jpg',
                              width: 140,
                              height: 85,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              'assets/images/cricket_ground_2.png.jpg',
                              width: 140,
                              height: 85,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              'assets/images/cricket_ground_3.png.jpg',
                              width: 140,
                              height: 85,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              'assets/images/cricket_ground_4.png.jpg',
                              width: 140,
                              height: 85,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              'assets/images/cricket_ground_5.png.png',
                              width: 140,
                              height: 85,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
