import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.short_text, color: Colors.black, size: 28),
                  const Text(
                    'My E-Wallet',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.search, color: Colors.black),
                      SizedBox(width: 12),
                      Icon(Icons.more_horiz, color: Colors.black),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 18),
              // Карта с градиентом и логотипами VISA + MasterCard
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const RadialGradient(
                    center: Alignment(-0.2, -0.6),
                    radius: 1.4,
                    colors: [
                      Color(0xFF333E4A),
                      Color(0xFF1E242B),
                      Color(0xFF0F1318),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 18,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Andrew Ainsley',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              'VISA',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.italic,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(width: 8),
                            _buildMasterCardLogo(),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '•••• •••• •••• 3629',
                      style: TextStyle(color: Colors.white60, fontSize: 13, letterSpacing: 1.5),
                    ),
                    const SizedBox(height: 24),
                    const Text('Your balance', style: TextStyle(color: Colors.white60, fontSize: 11)),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '\$9,379',
                          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_circle_down, size: 15, color: Colors.black87),
                          label: const Text(
                            'Top Up',
                            style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Transaction History', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {},
                    child: const Text('See All', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ),
                ],
              ),
              _buildTxItem('Lawson Chair', 'Dec 15, 2024 | 10:00 AM', '\$120', 'Orders', Icons.chair_outlined, isExpense: true),
              _buildTxItem('Top Up Wallet', 'Dec 14, 2024 | 16:42 PM', '\$400', 'Top Up', Icons.account_balance_wallet_outlined, isExpense: false),
              _buildTxItem('Parabolic Reflector', 'Dec 14, 2024 | 11:39 AM', '\$170', 'Orders', Icons.lightbulb_outline, isExpense: true),
              _buildTxItem('Mini Wooden Table', 'Dec 13, 2024 | 14:46 PM', '\$165', 'Orders', Icons.table_bar_outlined, isExpense: true),
              _buildTxItem('Top Up Wallet', 'Dec 12, 2024 | 09:27 AM', '\$300', 'Top Up', Icons.account_balance_wallet_outlined, isExpense: false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMasterCardLogo() {
    return SizedBox(
      width: 28,
      height: 18,
      child: Stack(
        children: [
          Container(
            width: 17,
            height: 17,
            decoration: const BoxDecoration(
              color: Color(0xFFEB001B),
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            left: 11,
            child: Container(
              width: 17,
              height: 17,
              decoration: BoxDecoration(
                color: const Color(0xFFF79E1B).withValues(alpha: 0.9),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTxItem(
    String title,
    String date,
    String amount,
    String type,
    IconData icon, {
    required bool isExpense,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: const Color(0xFFF1F5F9),
            child: Icon(icon, color: Colors.black87, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 2),
                Text(date, style: TextStyle(color: Colors.grey.shade400, fontSize: 11)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Text(type, style: TextStyle(color: Colors.grey.shade400, fontSize: 11)),
                  const SizedBox(width: 4),
                  Icon(
                    isExpense ? Icons.arrow_upward : Icons.arrow_downward,
                    size: 11,
                    color: isExpense ? Colors.red : Colors.blue,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}