import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.2), // Centered near the "Readora" text
            radius: 1.0,
            colors: [
              Color(0xFFB3B5FF), // Light indigo-blue (center)
              Color(0xFF9A76D2), // Deeper lavender
              Color(0xFF5A4FCF), // Deep indigo
            ],
            stops: [0.0, 0.4, 1.0], // ✅ Proper increasing order
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // "Readora" Text with Border and Fill Layers
              Stack(
                alignment: Alignment.center, // Centers text and progress indicator
                children: [
                  // Border layer for "Readora"
                  Text(
                    "Readora",
                    style: GoogleFonts.acme(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Color(0xFF800080), // Purple border
                    ),
                  ),
                  // Fill layer for "Readora"
                  Text(
                    "Readora",
                    style: GoogleFonts.acme(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3C3DB3), // Fill color
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10), // Space between text and the progress indicator
              const CircularProgressIndicator(
                color: Color(0xFF800080), // Purple color for the loader
              ),
            ],
          ),
        ),
      ),
    );
  }
}
