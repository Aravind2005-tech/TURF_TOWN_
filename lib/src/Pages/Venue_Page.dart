import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appbg1 {
  static const LinearGradient mainGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF140088),
        Color(0xFF000000),
      ],
      stops: [0.0,0.3]
  );
}

class CricketScorerHeader extends StatelessWidget {
  const CricketScorerHeader({super.key});

  static const Color accentColor = Colors.white;
  static const Color searchBarBackgroundColor = Color(0xFF545454);
  static const Color searchIconColor = Color(0xFF7751FF);
  static const double iconSize = 25.0;
  static const Color dividerColor = Color(0xFFFFFFFF);
  static const Color favouritesContainerColor = Color(0xFFD9D9D9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: Appbg1.mainGradient,
        ),
        child: Column(
          children: [
            SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          'Cricket',
                          style: GoogleFonts.poppins(
                            color: accentColor,
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'Scorer',
                            style: GoogleFonts.poppins(
                              color: accentColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      children: <Widget>[
                        Icon(Icons.headset_mic_outlined, color: accentColor, size: iconSize),
                        SizedBox(width: 16),
                        Icon(Icons.settings, color: accentColor, size: iconSize),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
              child: SearchBarWidget(
                color: searchBarBackgroundColor,
                iconColor: searchIconColor,
              ),
            ),

            Center(
              child: SizedBox(
                width: 360.0,
                child: Container(
                  height: 1.0,
                  color: dividerColor,
                ),
              ),
            ),

            const SizedBox(height: 16.0),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 116.0,
                  height: 16.0,
                  decoration: BoxDecoration(
                    color: favouritesContainerColor,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.favorite, color: Colors.red, size: 12),
                      const SizedBox(width: 4),
                      Text(
                        'Your Favourites',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16.0),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: const <Widget>[
                  FavouriteCard(
                    imagePath: 'assets/images/cricket_ground_1.png.jpg',
                    title: 'Goat Sports...',
                    subtitle: 'Lawspet',
                  ),
                  SizedBox(width: 16),
                  FavouriteCard(
                    imagePath: 'assets/images/cricket_ground_2.png.jpg',
                    title: 'The Sports S...',
                    subtitle: 'Kottakuppam',
                  ),
                  SizedBox(width: 16),
                  FavouriteCard(
                    imagePath: 'assets/images/cricket_ground_10.png.jpeg',
                    title: 'Providence Turf',
                    subtitle: 'Gorimedu',
                  ),
                  SizedBox(width: 16),
                ],
              ),
            ),

            // MODIFIED: Reduced SizedBox height from 4.0 to 2.0
            const SizedBox(height: 2.0),
            Center(
              child: SizedBox(
                width: 360.0,
                child: Container(
                  height: 1.0,
                  color: dividerColor,
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    final List<Map<String, dynamic>> turfData = [
                      {
                        'imagePath': 'assets/images/cricket_ground_4.png.jpg',
                        'title': 'Turf 10',
                        'subtitle': 'Ellaipillaichavady ~ 3.5km',
                        'rating': '4.2',
                      },
                      {
                        'imagePath': 'assets/images/cricket_ground_6.png.png',
                        'title': 'Pondy Pitch',
                        'subtitle': 'Ariyankuppam ~ 7.3km',
                        'rating': '4.8',
                      },
                      {
                        'imagePath': 'assets/images/cricket_ground_7.png.png',
                        'title': 'Goat Sports Arena',
                        'subtitle': 'Lawspet ~ 0.7km',
                        'rating': '4.8',
                      },
                      {
                        'imagePath': 'assets/images/cricket_ground_8.png.png',
                        'title': 'Lotus',
                        'subtitle': 'Lawspet ~ 0.5km',
                        'rating': '4.1',
                      },
                      {
                        'imagePath': 'assets/images/cricket_ground_9.png.png',
                        'title': 'Aadukalam',
                        'subtitle': 'Lawspet ~ 0.5km',
                        'rating': '3.7',
                      },
                      {
                        'imagePath': 'assets/images/cricket_ground_4.png.jpg',
                        'title': 'The Sports Studio',
                        'subtitle': 'Lawspet ~ 0.5km',
                        'rating': '4.5',
                      },
                    ];
                    final item = turfData[index];
                    return TurfCard(
                      imagePath: item['imagePath'],
                      title: item['title'],
                      subtitle: item['subtitle'],
                      rating: item['rating'],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  final Color color;
  final Color iconColor;

  const SearchBarWidget({
    super.key,
    required this.color,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            color: iconColor,
            size: 18.0,
          ),
          const Expanded(
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}

class FavouriteCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final double cardWidth;
  final double cardHeight;
  final double imageHeight;
  final bool showFavoriteIcon;

  const FavouriteCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    this.cardWidth = 150,
    this.cardHeight = 180,
    this.imageHeight = 110,
    this.showFavoriteIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: imageHeight,
            width: double.infinity,
            child: Stack(
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                if (showFavoriteIcon)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.favorite, color: Colors.red, size: 18),
                    ),
                  ),
              ],
            ),
          ),
          if (subtitle.isNotEmpty || title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (subtitle.isNotEmpty)
                    Text(
                      subtitle,
                      style: GoogleFonts.poppins(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class TurfCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String rating;

  const TurfCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 85,
            child: Stack(
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(Icons.favorite_border, color: Colors.white, size: 18),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == 0 ? Colors.white : Colors.white54,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        subtitle,
                        style: GoogleFonts.poppins(
                          color: Colors.white70,
                          fontSize: 10,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          rating,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.star, color: Colors.white, size: 10),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CricketScorerHeader(),
    );
  }
}