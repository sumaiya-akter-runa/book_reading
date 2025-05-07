import 'package:book_reading/home_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void goToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()), // Replace with your next screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = (index == 2);
                  });
                },
                children: const [
                  OnboardingPage(
                    image: 'assets/images/read1.svg',
                    title: 'Welcome to Readora',
                    description:
                    'Discover and enjoy thousands of books in all genres.',
                  ),
                  OnboardingPage(
                    image: 'assets/images/read2.svg',
                    title: 'Personalized Reading',
                    description:
                    'Get recommendations based on your interests and habits.',
                  ),
                  OnboardingPage(
                    image: 'assets/images/read3.svg',
                    title: 'Subscribe and Enjoy',
                    description:
                    'Subscribe for unlimited access to your favorite books.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotColor: Colors.white,
                activeDotColor: Colors.deepPurple,
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
            const SizedBox(height: 30),
            isLastPage
                ? ElevatedButton(
              onPressed: goToNextScreen,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Get Started",
                  style: TextStyle(fontSize: 16)),
            )
                : TextButton(
              onPressed: () {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: const Text("Next",
                  style: TextStyle(color: Colors.deepPurple)),
            )
          ],
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(image),
        ),
        const SizedBox(height: 30),
        Text(
          title,
          style: const TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),
        Text(
          description,
          style: const TextStyle(fontSize: 16, color: Colors.black54),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
