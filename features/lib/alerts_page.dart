import 'package:flutter/material.dart';

class AlertsPage extends StatefulWidget {
  const AlertsPage({super.key});

  @override
  State<AlertsPage> createState() => _AlertsPageState();
}

class _AlertsPageState extends State<AlertsPage> {
  int _selectedIndex = 4;

  final alerts = [
    'Spring turf open — flat 20% off today!',
    'Special offer! Book a nearby turf and save ₹100.',
    'Your pitch awaits! and it\'s cheaper today',
    'Drop shot deals! Book badminton turf now & save',
    'Good news! A nearby turf is ready for play.'
  ];

  final List<IconData> _icons = [
    Icons.sports_cricket,
    Icons.history,
    Icons.home,
    Icons.people,
    Icons.notifications,
  ];

  final List<String> _labels = [
    "Venue",
    "Recently Played",
    "Home",
    "Connection",
    "Alerts",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050036),
      appBar: AppBar(
        backgroundColor: const Color(0xFF050036),
        elevation: 0,
        title: const Text(
          'Cricket Scorer',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: const [
          Icon(Icons.headphones, color: Colors.white),
          SizedBox(width: 20),
          Icon(Icons.settings, color: Colors.white),
          SizedBox(width: 20),
        ],
      ),

      body: Column(
        children: [
          // 🔔 Alert Header
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1070),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                '🔔 Alert !',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),

          // 🗒 Alerts List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: alerts.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: index % 2 == 0
                        ? const Color(0xFF7FBF7F)
                        : const Color(0xFF2E2E2E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.campaign, color: Colors.white),
                    title: Text(
                      alerts[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // 🟡 Custom Floating Navigation Bar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16), // 👈 Makes bar float up
        child: Container(
          height: 80,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFF0A004B),
            borderRadius: BorderRadius.circular(40),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 12,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_icons.length, (index) {
              final bool isSelected = _selectedIndex == index;
              final bool isCenter = index == 2;

              return GestureDetector(
                onTap: () {
                  setState(() => _selectedIndex = index);
                  // Add navigation logic here later
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  margin: EdgeInsets.only(
                    top: isSelected ? 2 : 10, // 👈 lift upward animation
                    bottom: isSelected ? 8 : 0,
                  ),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF050036)
                        : Colors.transparent,
                    shape: BoxShape.circle,
                    boxShadow: isSelected
                        ? [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.6),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ]
                        : [],
                  ),
                  child: AnimatedScale(
                    scale: isSelected ? 1.25 : 1.0, // 👈 enlarge on select
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOutBack,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _icons[index],
                          color:
                          isSelected ? Colors.white : Colors.white70,
                          size: isSelected ? 30 : 25,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          _labels[index],
                          style: TextStyle(
                            color:
                            isSelected ? Colors.white : Colors.white54,
                            fontSize: 10,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
