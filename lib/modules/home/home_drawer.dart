import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategoryChanged;

  const HomeDrawer({
    super.key,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SizedBox.expand(
        child: Stack(
          children: [
            Image.asset(
              selectedCategory == 'Woman'
                  ? 'assets/images/women_drawer_bg.webp'
                  : 'assets/images/men_drawer_bg.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              color: Colors.black.withOpacity(0.5),
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => onCategoryChanged('Woman'),
                          child: Text(
                            "Woman",
                            style: TextStyle(
                              color: selectedCategory == 'Woman' ? Colors.white : Colors.grey,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              decoration: selectedCategory == 'Woman' ? TextDecoration.underline : null,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () => onCategoryChanged('Man'),
                          child: Text(
                            "Man",
                            style: TextStyle(
                              color: selectedCategory == 'Man' ? Colors.white : Colors.grey,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              decoration: selectedCategory == 'Man' ? TextDecoration.underline : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      children: selectedCategory == 'Woman'
                          ? [
                              _buildDrawerItem("Stitched Kurti"),
                              _buildDrawerItem("Saree"),
                              _buildDrawerItem("Anarkalis"),
                              _buildDrawerItem("Kurta Sets"),
                              _buildDrawerItem("Dupatta"),
                            ]
                          : [
                              _buildDrawerItem("Kurta"),
                              _buildDrawerItem("Pyjama"),
                              _buildDrawerItem("Kurta Sets"),
                              _buildDrawerItem("Sherwani"),
                            ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {},
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            padding: const EdgeInsets.only(bottom: 4),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.transparent),
              ),
            ),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}