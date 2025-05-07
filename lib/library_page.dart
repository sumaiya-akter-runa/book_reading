import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // My Bookshelf
              _sectionHeader("My Bookshelf"),
              const SizedBox(height: 8),
              _buildBookList(),

              const SizedBox(height: 20),
              _sectionHeader("Continue Reading"),
              const SizedBox(height: 8),
              _buildContinueReadingCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2E2E2E)),
      ),
    );
  }

  Widget _buildBookList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => Card(
          color: Colors.white,
          elevation: 2,
          child: ListTile(
            leading: const Icon(Icons.book, color: Color(0xFF5D5FEF)),
            title: Text("Book ${index + 1}",
                style: const TextStyle(color: Color(0xFF2E2E2E))),
            subtitle: LinearProgressIndicator(
              value: 0.5,
              color: const Color(0xFF5D5FEF),
              backgroundColor: const Color(0xFFD3D3D3),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContinueReadingCard() {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: const Icon(Icons.play_arrow, color: Color(0xFFF2A365)),
        title: const Text("Continue reading Book 1",
            style: TextStyle(color: Color(0xFF2E2E2E))),
        subtitle: const Text("50% completed",
            style: TextStyle(color: Color(0xFF6E6E6E))),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
