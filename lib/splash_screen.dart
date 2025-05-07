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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFBC2EB), // light pink
              Color(0xFFA18CD1), // soft purple
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset("assets/images/logo.png", width: 200, height: 200),
              // const SizedBox(height: 10),
              Stack(
                children: [
                  // Border layer
                  Text(
                    "Readora",
                    style: GoogleFonts.acme(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Color(0xFF800080), // Purple border
                    ),
                  ),
                  // Fill layer
                  Text(
                    "Readora",
                    style: GoogleFonts.acme(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Fill color
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              const CircularProgressIndicator(color: Color(0xFF800080)),

            ],
          ),
        ),
      ),
    );
  }
}
