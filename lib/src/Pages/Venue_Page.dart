import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:TURF_TOWN_/src/CommonParameters/AppBackGround1/Appbg1.dart';
import 'package:TURF_TOWN_/src/Widgets/Navigation_bar.dart';
// --- Data Models (for easier state management) ---
class TurfItem {
  final String imagePath;
  final String title;
  final String subtitle;
  final String rating;

  TurfItem({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.rating,
  });

  // Unique key for identification
  String get id => title;
}


// --- Static Gradient and Colors (Unchanged) ---

class CricketScorerHeader extends StatefulWidget {
  const CricketScorerHeader({super.key});

  static Color? get searchIconColor => null;

  @override
  State<CricketScorerHeader> createState() => _CricketScorerHeaderState();
}

class _CricketScorerHeaderState extends State<CricketScorerHeader> {
  static const Color accentColor = Colors.white;
  static const Color searchBarBackgroundColor = Color(0xFF545454);
  static const Color searchIconColor = Color(0xFF7751FF);
  static const double iconSize = 25.0;
  static const Color dividerColor = Color(0xFFFFFFFF);
  static const Color favouritesContainerColor = Color(0xFFD9D9D9);

  int _selectedIndex = 2;
  // --- 1. Master List of all Turfs ---
  final List<TurfItem> _allTurfs = [
    TurfItem(imagePath: 'assets/images/cricket_ground_1.png.jpg', title: 'Goat Sports...', subtitle: 'Lawspet', rating: '4.5'),
    TurfItem(imagePath: 'assets/images/cricket_ground_2.png.jpg', title: 'The Sports S...', subtitle: 'Kottakuppam', rating: '4.0'),
    TurfItem(imagePath: 'assets/images/cricket_ground_10.png.jpeg', title: 'Providence Turf', subtitle: 'Gorimedu', rating: '4.6'),
    TurfItem(imagePath: 'assets/images/cricket_ground_4.png.jpg', title: 'Turf 10', subtitle: 'Ellaipillaichavady ~ 3.5km', rating: '4.2'),
    TurfItem(imagePath: 'assets/images/cricket_ground_6.png.png', title: 'Pondy Pitch', subtitle: 'Ariyankuppam ~ 7.3km', rating: '4.8'),
    TurfItem(imagePath: 'assets/images/cricket_ground_7.png.png', title: 'Goat Sports Arena', subtitle: 'Lawspet ~ 0.7km', rating: '4.8'),
    TurfItem(imagePath: 'assets/images/cricket_ground_8.png.png', title: 'Lotus', subtitle: 'Lawspet ~ 0.5km', rating: '4.1'),
    TurfItem(imagePath: 'assets/images/cricket_ground_9.png.png', title: 'Aadukalam', subtitle: 'Lawspet ~ 0.5km', rating: '3.7'),
    TurfItem(imagePath: 'assets/images/cricket_ground_4.png.jpg', title: 'The Sports Studio', subtitle: 'Lawspet ~ 0.5km', rating: '4.5'),
  ];

  // --- 2. State List for Favorites (only tracking the IDs/titles) ---
  final List<String> _favoriteTurfIds = ['Goat Sports...', 'The Sports S...', 'Providence Turf']; // Initial favorites

  // --- 3. Toggle Function ---
  void _toggleFavorite(String turfId) {
    setState(() {
      if (_favoriteTurfIds.contains(turfId)) {
        _favoriteTurfIds.remove(turfId);
      } else {
        _favoriteTurfIds.add(turfId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    // Filter the master list into the two sections
    final List<TurfItem> favoriteCards = _allTurfs.where((turf) => _favoriteTurfIds.contains(turf.id)).toList();
    final List<TurfItem> gridTurfs = _allTurfs.where((turf) => !_favoriteTurfIds.contains(turf.id)).toList();

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
  body:

      Container(
        decoration: const BoxDecoration(
          gradient: Appbg1.mainGradient,
        ),
        child: Column(
          children: [
            // --- HEADER SECTION (Unchanged) ---
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

            // --- SEARCH BAR (Unchanged Dimensions) ---
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
              child: Center(
                child: SearchBarWidget(
                  color: searchBarBackgroundColor,
                  iconColor: searchIconColor,
                  width: 317.0,
                  height: 32.0,
                ),
              ),
            ),

            // --- DIVIDER 1 ---
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

            // --- YOUR FAVORITES LABEL ---
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

            // --- FAVORITES LIST (Built dynamically from state) ---
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: favoriteCards.length,
                itemBuilder: (context, index) {
                  final item = favoriteCards[index];
                  return Padding(
                    padding: index < favoriteCards.length - 1 ? const EdgeInsets.only(right: 16.0) : EdgeInsets.zero,
                    child: FavouriteCard(
                      imagePath: item.imagePath,
                      title: item.title,
                      subtitle: item.subtitle,
                      // FAVORITES can also be unfavorited
                      onToggleFavorite: () => _toggleFavorite(item.id),
                    ),
                  );
                },
              ),
            ),

            // --- DIVIDER 2 (Adjusted spacing to 2.0) ---
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

            // --- GRID VIEW (Shows non-favorites) ---
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
                  itemCount: gridTurfs.length,
                  itemBuilder: (context, index) {
                    final item = gridTurfs[index];
                    return TurfCard(
                      imagePath: item.imagePath,
                      title: item.title,
                      subtitle: item.subtitle,
                      rating: item.rating,
                      isFavorite: false, // Grid items are non-favorites
                      onToggleFavorite: () => _toggleFavorite(item.id),
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

// --- SearchBarWidget (Unchanged) ---
class SearchBarWidget extends StatelessWidget {
  final Color color;
  final Color iconColor;
  final double width;
  final double height;

  const SearchBarWidget({
    super.key,
    required this.color,
    required this.iconColor,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            color: CricketScorerHeader.searchIconColor,
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

// --- FavouriteCard (Modified to accept onToggleFavorite) ---
class FavouriteCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final double cardWidth;
  final double cardHeight;
  final double imageHeight;
  final VoidCallback? onToggleFavorite;

  const FavouriteCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    this.cardWidth = 150,
    this.cardHeight = 180,
    this.imageHeight = 110,
    this.onToggleFavorite,
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
                // Heart icon is always red and filled here, but clickable
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: onToggleFavorite,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.favorite, color: Colors.red, size: 18),
                    ),
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
                ),
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

// --- TurfCard (Modified to show favorite state and be clickable) ---
class TurfCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String rating;
  final bool isFavorite; // New flag
  final VoidCallback? onToggleFavorite; // New callback

  const TurfCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.rating,
    this.isFavorite = false,
    this.onToggleFavorite,
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
                // Heart icon changes based on isFavorite
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: onToggleFavorite, // Click to toggle favorite status
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.white,
                        size: 18,
                      ),
                    ),
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