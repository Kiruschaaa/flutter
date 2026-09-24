import 'package:flutter/material.dart';

class PopularMenuScreen extends StatelessWidget {
  const PopularMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const pinkColor = Color(0xFFF96076);

    return Scaffold(
      backgroundColor: const Color(0xFFFAFBFD),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDECEF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.arrow_back_ios_new, size: 16, color: pinkColor),
                      onPressed: () {},
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Popular Menu',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 38),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey.shade400, size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                                border: InputBorder.none,
                                isDense: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDECEF),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.tune, color: pinkColor, size: 20),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                children: [
                  _buildMenuItem(
                    title: 'Original Salad',
                    subtitle: 'Lovy Food',
                    price: '\$8',
                    imagePath: 'assets/images/img7.png',
                  ),
                  _buildMenuItem(
                    title: 'Fresh Salad',
                    subtitle: 'Cloudy Resto',
                    price: '\$10',
                    imagePath: 'assets/images/img8.png',
                  ),
                  _buildMenuItem(
                    title: 'Yummie Ice Cream',
                    subtitle: 'Circlo Resto',
                    price: '\$6',
                    imagePath: 'assets/images/img10.png',
                  ),
                  _buildMenuItem(
                    title: 'Vegan Special',
                    subtitle: 'Haty Food',
                    price: '\$11',
                    imagePath: 'assets/images/img11.png',
                  ),
                  _buildMenuItem(
                    title: 'Mixed Pasta',
                    subtitle: 'Recto Food',
                    price: '\$13',
                    imagePath: 'assets/images/img12.png',
                  ),
                ],
              ),
            ),
            _buildCustomBottomNav(),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomBottomNav() {
    const pinkColor = Color(0xFFF96076);

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFFDECEF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: const [
                Icon(Icons.home_filled, color: pinkColor, size: 18),
                SizedBox(width: 6),
                Text(
                  'Home',
                  style: TextStyle(
                    color: pinkColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_basket_rounded, color: pinkColor, size: 22),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chat_bubble_rounded, color: pinkColor, size: 20),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_rounded, color: pinkColor, size: 22),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required String title,
    required String subtitle,
    required String price,
    required String imagePath,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 52,
              width: 52,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 2),
                Text(subtitle, style: TextStyle(color: Colors.grey.shade400, fontSize: 12)),
              ],
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              color: Color(0xFFF96076),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 4),
        ],
      ),
    );
  }
}