import 'package:flutter/material.dart';
import 'package:turf_cricket/src/CommonParameters/AppBackGround1/Appbg1.dart';

class PhoneNumberPage extends StatelessWidget {
  const PhoneNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SingleChildScrollView(
            child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: Appbg1.mainGradient,
          ),
        ),
          Positioned(
            top: 230,
            left: 80,
            child: Text(
              'Enter your Phone\nNumber',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  label: Text('Phone Number',),
                  prefixText: '+91 ',
                  filled: true,
                  fillColor: Color(0xFFC6C3C3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          )
      ]
        )
    )
    );
  }
}