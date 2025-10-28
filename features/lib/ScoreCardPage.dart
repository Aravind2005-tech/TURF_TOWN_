import 'package:flutter/material.dart';
// import 'package:TURF_TOWN_/src/Pages/Otp.dart';
import 'package:turf_scorer/Appbg1.dart';

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  bool _isExtrasMenuOpen = false;

  void _toggleExtrasMenu() {
    setState(() {
      _isExtrasMenuOpen = !_isExtrasMenuOpen;
    });
  }
  void _showPopupButtons(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Color(0xFF2A313B),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext bc) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.wb_sunny_outlined, color: Colors.white),
                title: Text('Wide Ball', style: TextStyle(color: Colors.white)),
                onTap: () {
                  print('Wide Ball clicked!');
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.close, color: Colors.white),
                title: Text('No Ball', style: TextStyle(color: Colors.white)),
                onTap: () {
                  print('No Ball clicked!');
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.do_not_disturb_on_total_silence, color: Colors.white),
                title: Text('Leg Bye', style: TextStyle(color: Colors.white)),
                onTap: () {
                  print('Leg Bye clicked!');
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
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
                SizedBox(height: 35),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 3.0),
                      child: IconButton(
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                        iconSize: 30.0,
                        tooltip: 'Verify OTP',
                        onPressed: () {
                          print("Menu button pressed");
                        },
                      ),
                    ),
                    Text(
                      'Cricket',
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                    SizedBox(width: 5),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        'Scorer',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Score Board',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 87,
                    decoration: BoxDecoration(
                      color: Color(0xFF2A313B),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:20.0),
                                child: Text(
                                  'IND',
                                  style: TextStyle(color: Colors.white, fontSize: 22),
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'CRR : 300.00',
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'NRR : 7.09',
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '30-0',
                                style: TextStyle(color: Colors.white, fontSize: 22),
                              ),
                              SizedBox(height: 2),
                              Text(
                                '(7.3)',
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 118,
                    decoration: BoxDecoration(
                      color: Color(0xFF2A313B),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedOpacity(
            opacity: _isExtrasMenuOpen ? 1.0 : 0.0,
            duration: Duration(milliseconds: 300),
            child: _isExtrasMenuOpen ? GestureDetector(
              onTap: _toggleExtrasMenu,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                // Semi-transparent black color
                color: Colors.black.withOpacity(0.6),
              ),
            ) : IgnorePointer(),
          ),
          _buildAnimatedRadialButton(
            label: 'Byes',
            left: 20.0,
            bottom: _isExtrasMenuOpen ? 180.0 : 20.0,
            opacity: _isExtrasMenuOpen ? 1.0 : 0.0,
            onPressed: () {
              print('Byes button pressed!');
              _toggleExtrasMenu();
            },
          ),
          _buildAnimatedRadialButton(
            label: 'Wide',
            left: _isExtrasMenuOpen ? 90.0 : 20.0,
            bottom: _isExtrasMenuOpen ? 100.0 : 20.0,
            opacity: _isExtrasMenuOpen ? 1.0 : 0.0,
            onPressed: () {
              print('Wide button pressed!');
              _toggleExtrasMenu();
            },
          ),
          _buildAnimatedRadialButton(
            label: 'No ball',
            left: _isExtrasMenuOpen ? 160.0 : 20.0,
            bottom: _isExtrasMenuOpen ? 20.0 : 20.0,
            opacity: _isExtrasMenuOpen ? 1.0 : 0.0,
            onPressed: () {
              print('No ball button pressed!');
              _toggleExtrasMenu();
            },
          ),
          Positioned(
            left: 20.0,
            bottom: 20.0,
            child: FloatingActionButton(
              onPressed: _toggleExtrasMenu,
              child: Text(
                'Extras',
                style: TextStyle(
                  color: Color(0xFF2A313B),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              backgroundColor: Colors.white,
              tooltip: 'Extras Menu',
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
          Positioned(
            right: 20.0,
            bottom: 20.0,
            child: FloatingActionButton(
              onPressed: () {
                print('Undo button pressed!');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.undo,
                    color: Color(0xFF2A313B),
                    size: 20, // Adjusted size to fit text
                  ),
                  Text(
                    'Undo',
                    style: TextStyle(
                      color: Color(0xFF2A313B),
                      fontWeight: FontWeight.bold,
                      fontSize: 10, // Small font to fit
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.white,
              tooltip: 'Undo Last Action',
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0), // Fully circular
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildAnimatedRadialButton({
    required String label,
    required double left,
    required double bottom,
    required double opacity,
    required VoidCallback onPressed,
  }) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
      left: left,
      bottom: bottom,
      child: AnimatedOpacity(
        opacity: opacity,
        duration: Duration(milliseconds: 300),
        child: Visibility(
          visible: _isExtrasMenuOpen,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: CircleBorder(),
              padding: EdgeInsets.all(16),
              minimumSize: Size(60, 60),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

