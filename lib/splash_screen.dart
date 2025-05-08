import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
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
      backgroundColor: Colors.white, // White background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie Animation (Logo)
            SizedBox(
              height: 200,
              child: Lottie.asset('assets/animation/logo.json'),
            ),

            // Spacer
            const SizedBox(height: 20),
// "Readora" Text with lighter purple color and no border
            Text(
              "Readora",
              style: GoogleFonts.acme(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF763A7A), // Lightened purple tone
              ),
            ),


            const SizedBox(height: 10),

            // Circular Loader
            // const CircularProgressIndicator(
            //   color: Color(0xFF800080),
            // ),
          ],
        ),
      ),
    );
  }
}
