// Added these imports for location
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

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

  // No changes in this part
  final List<Widget> _pages = [
    CricketScorerHeader(),
    HomeContent(), // This will now create the StatefulWidget
    HomeContent(),
    HomeContent(),
    HomeContent(),
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

//
// --- MODIFICATIONS START HERE ---
//
// 1. Converted HomeContent to a StatefulWidget
class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  // 2. Added state variable to hold the location name
  String _currentLocationName = "Loading...";

  // 3. Added initState to call the location function when the widget loads
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // 4. Added the function to get and set the location
  Future<void> _getCurrentLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() => _currentLocationName = "Enable GPS");
        return;
      }

      // Check for location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() => _currentLocationName = "Grant Permission");
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(
                () => _currentLocationName = "Permission Denied");
        return;
      }

      // Get the current position
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Get placemark from coordinates
      List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);

      // Extract a readable name
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        String name = place.subLocality ?? place.locality ?? "Unknown Location";

        // Truncate if too long, just like "Periya Muthali..."
        if (name.length > 15) {
          name = "${name.substring(0, 15)}...";
        }

        setState(() {
          _currentLocationName = name;
        });
      }
    } catch (e) {
      print("Error getting location: $e");
      setState(() => _currentLocationName = "Error");
    }
  }

  // 5. Moved the original build method here
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
                                //
                                // 6. Replaced the hard-coded text with the state variable
                                //
                                Text(
                                  _currentLocationName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // --- The rest of your code is unchanged ---
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
                        GestureDetector(
                          onTap: () {
                            // Add your function or navigation code here
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CricketScorerHeader(),
                              ),
                            );
                            print("See All tapped!");
                          },
                          child: Text(
                            "See All",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 12,
                            ),
                          ),
                        )
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