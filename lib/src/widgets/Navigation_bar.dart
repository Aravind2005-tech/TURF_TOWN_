import 'package:flutter/material.dart';

class Navigation_bar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap; // Callback function

  const Navigation_bar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  // I moved your _buildNavItem method here.
  // I just changed 'setState' to call 'onTap'
  // and '_selectedIndex' to 'currentIndex'.
  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = currentIndex == index;
    Color unselectedColor = Colors.grey.shade400;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index), // Use the callback
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
    // This is your exact UI code from the Positioned widget,
    // just wrapped in a Container.
    return Container(
      height: 90,
      // The original Positioned had 'bottom: 12, left: 12, right: 12'
      // We can achieve the same "floating" look with a simple margin.
      margin: EdgeInsets.only(left: 12, right: 12, bottom: 12),
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
                color: Color(0x80140088),
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
    );
  }
}