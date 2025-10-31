import 'package:flutter/material.dart';
import 'package:TURF_TOWN_/src/CommonParameters/AppBackGround1/Appbg1.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:TURF_TOWN_/src/views/ScoreCard.dart';
import 'package:TURF_TOWN_/src/viewmodels/ScoreController.dart';
import 'package:TURF_TOWN_/src/widgets/Navigation_bar.dart';
import 'package:TURF_TOWN_/src/Pages/setting.dart';
import 'package:TURF_TOWN_/src/Pages/account.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // We STILL keep this. The Home page needs to know the active index.
  int _selectedIndex = 2; // 2 = Home



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // This is perfect for a custom nav bar

      // 2. ADD THE bottomNavigationBar PROPERTY
      bottomNavigationBar: Navigation_bar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          // You can add other logic here, like navigating
          // to different pages using a PageView or Navigator
        },
      ),

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
                      // ... (Your existing header code - no change)
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context)=> ProfileScreen())
                                  );
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.settings, color: Colors.white),
                                onPressed: () {
                                      Navigator.push(
                                        context,
                                      MaterialPageRoute(builder: (context)=> SettingsScreen())
                                      );
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
                      // ... (Your existing search bar - no change)
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
                      // ... (Your existing "cri_slider" horizontal list - no change)
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
                      // ... (Your existing "Book a nearby Venue" row - no change)
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
                      // ... (Your existing "page3.png" horizontal list - no change)
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
        ],
      ),
    );
  }
}