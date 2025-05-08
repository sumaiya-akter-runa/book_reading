import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search categories',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFDADADA)), // border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF5D5FEF)), // active border color
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Category Chips
              const Text('Browse by Category',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E2E2E))),
              const SizedBox(height: 12),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildChip('Fiction'),
                  _buildChip('Mystery'),
                  _buildChip('Self-help'),
                  _buildChip('Romance'),
                  _buildChip('Science'),
                  _buildChip('Biography'),
                  _buildChip('Fantasy'),
                  _buildChip('Thriller'),
                  _buildChip('Children'),
                  _buildChip('History'),
                  _buildChip('Comics'),
                  _buildChip('Adventure'),
                ],
              ),

              const SizedBox(height: 30),

              // Popular Categories
              const Text('Popular Categories',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E2E2E))),
              const SizedBox(height: 12),
              _buildPopularCategoryList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: const Color(0xFFE3F6FF),
      labelStyle: const TextStyle(color: Color(0xFF5D5FEF)),
    );
  }

  Widget _buildPopularCategoryList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: const Icon(Icons.local_fire_department, color: Color(0xFF5D5FEF)),
            title: Text("Popular Category ${index + 1}",
                style: const TextStyle(color: Color(0xFF2E2E2E))),
            subtitle: const Text("Top books in this category",
                style: TextStyle(color: Color(0xFF6E6E6E))),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ),
      ),
    );
  }
}
