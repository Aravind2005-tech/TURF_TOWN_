import 'package:flutter/material.dart';
import 'package:TURF_TOWN_/src/CommonParameters/AppBackGround1/Appbg1.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:TURF_TOWN_/src/views/ScoreCard.dart';
import 'package:TURF_TOWN_/src/viewmodels/ScoreController.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 2; // 2 = Home

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index;
    Color unselectedColor = Colors.grey.shade400;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedIndex = index),
        child: Container(
          height: 90,
          color: Colors.transparent,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isSelected ? 0.0 : 1.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 10),
                    Icon(icon, size: 24, color: unselectedColor),
                    SizedBox(height: 4),
                    Text(
                      label,
                      style: TextStyle(color: unselectedColor, fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                bottom: isSelected ? 25 : 10,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isSelected ? 1.0 : 0.0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFF4A3F9E),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 8,
                                offset: Offset(0, 2),
                              )
                            ]),
                        child: Icon(icon, color: Colors.white, size: 30),
                      ),
                      SizedBox(height: 4),
                      Text(
                        label,
                        style: TextStyle(
                          color: isSelected ? Colors.white : unselectedColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
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
                              Icon(Icons.location_on,
                                  color: Colors.white, size: 24),
                              const SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Your Location",
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.4),
                                        fontSize: 10),
                                  ),
                                  Text(
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
                                icon: Icon(Icons.person, color: Colors.white),
                                onPressed: () {
                                  // profile icon pressed
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.settings, color: Colors.white),
                                onPressed: () {
                                  // settings icon pressed
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 20,
                      right: 20,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF545454),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            icon: Icon(Icons.search,
                                color: Colors.white.withOpacity(0.7)),
                            hintText: "Search...",
                            hintStyle:
                            TextStyle(color: Colors.white.withOpacity(0.7)),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
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
                                print("Cricket image clicked!");
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Board()));
                                // Add your navigation or logic here
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
                              onTap: () {
                                print("Football image clicked!");
                              },
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
                              onTap: () {
                                print("Badminton image clicked!");
                              },
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
                    Positioned(
                      top: 370,
                      left: 20,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Book a nearby Venue",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 80),
                          Text(
                            "See All",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
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
                                'assets/images/page3.png',
                                width: 140,
                                height: 85,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset(
                                'assets/images/page2.png',
                                width: 140,
                                height: 85,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset(
                                'assets/images/page1.png',
                                width: 140,
                                height: 85,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset(
                                'assets/images/page2.png',
                                width: 140,
                                height: 85,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset(
                                'assets/images/page3.png',
                                width: 140,
                                height: 85,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            right: 12,
            child: Container(
              height: 90,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 70,
                    child: Container(
                      decoration: BoxDecoration(
                        color:  Color(0x80140088),
                        borderRadius: BorderRadius.circular(50.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildNavItem(Icons.stadium_outlined, "Venue", 0),
                        _buildNavItem(Icons.history, "Recently Played", 1),
                        _buildNavItem(Icons.home_outlined, "Home", 2),
                        _buildNavItem(Icons.bluetooth, "Connection", 3),
                        _buildNavItem(Icons.notifications_outlined, "Alerts", 4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

