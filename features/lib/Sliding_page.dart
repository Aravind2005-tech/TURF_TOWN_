import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SlidingPage extends StatefulWidget {
  @override
  _SlidingPageState createState() => _SlidingPageState();
}

class _SlidingPageState extends State<SlidingPage> {
  int _currentIndex = 0; // Track the current slide

  final List<Map<String, String>> pages = [
    {'image': 'assets/images/page1.png', 'text': 'SportTrax.'},
    {'image': 'assets/images/page2.png', 'text': 'Your New Favourite Place.'},
    {'image': 'assets/images/page3.png', 'text': 'Meet new friends on court.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [ Color(0xFF140088), Colors.black ],
                stops: [0.0,0.4],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),


          CarouselSlider.builder(
            itemCount: pages.length,
            itemBuilder: (context, index, realIdx) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   const SizedBox(height: 100),
                  Text(
                    pages[index]['text']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  Image.asset(
                    pages[index]['image']!,
                    height: 476,
                    width: 284,
                    fit: BoxFit.contain,
                  ),
                ],
              );
            },
            options: CarouselOptions(
              height: double.infinity,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              enlargeCenterPage: true,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),

          // Bottom-centered dots
          Positioned(
            bottom: 110, // Increase bottom to move dots above the Start button
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pages.asMap().entries.map((entry) {
                return Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == entry.key
                        ? Colors.white
                        : Colors.white.withOpacity(0.4),
                  ),
                );
              }).toList(),
            ),
          ),
          //Start button (only on last page)
          if (_currentIndex == pages.length - 1)
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to your main screen
                    print("Start button pressed");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0x8000C4FF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Start",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
