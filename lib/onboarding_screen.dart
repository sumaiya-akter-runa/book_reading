import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:book_reading/home_page.dart';

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
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: Padding(
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
                    "Discover endless stories, adventures, and knowledge with Readora. Whether you're into fiction, non-fiction, or anything in between, we have books for everyone. Start your reading journey today!",
                  ),
                  OnboardingPage(
                    image: 'assets/images/read2.svg',
                    title: 'Personalized Reading',
                    description:
                    "Unlock unlimited access to thousands of books. Enjoy exclusive content, personalized picks, and read anywhere, anytime.",
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
                dotColor: Color(0xFFD3D3D3),
                activeDotColor: Color(0xFF5D5FEF),
                dotHeight: 10,
                dotWidth: 10,
              ),
            ),
            const SizedBox(height: 30),
            isLastPage
                ? ElevatedButton(
              onPressed: goToNextScreen,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5D5FEF),
                padding: const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Get Started",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            )
                : TextButton(
              onPressed: () {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: const Text(
                "Next",
                style: TextStyle(
                  color: Color(0xFF5D5FEF),
                  fontSize: 16,
                ),
              ),
            ),
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
          child: SvgPicture.asset(
            image,
            placeholderBuilder: (context) =>
            const Center(child: CircularProgressIndicator()),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2E2E2E),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),
        Text(
          description,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF6E6E6E),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}