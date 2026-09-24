import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'MedinowWelcomeScreen.dart';
import 'MeditationCatalogScreen.dart';
import 'WalletScreen.dart';
import 'PopularMenuScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI Mockups',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const AdaptiveAppShell(),
    );
  }
}

class AdaptiveAppShell extends StatefulWidget {
  const AdaptiveAppShell({super.key});

  @override
  State<AdaptiveAppShell> createState() => _AdaptiveAppShellState();
}

class _AdaptiveAppShellState extends State<AdaptiveAppShell> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    MedinowWelcomeScreen(),
    MeditationCatalogScreen(),
    PopularMenuScreen(),
    WalletScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final mobileContent = Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF039EA1),
        unselectedItemColor: Colors.grey.shade400,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.self_improvement), label: 'Screen 1'),
          BottomNavigationBarItem(icon: Icon(Icons.spa), label: 'Screen 2'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: 'Screen 3'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Screen 4'),
        ],
      ),
    );

    if (!kIsWeb) {
      return mobileContent;
    }

    return Scaffold(
      backgroundColor: const Color(0xFF1E293B),
      body: Center(
        child: Container(
          width: 390,
          height: 844,
          margin: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(48),
            border: Border.all(color: const Color(0xFF334155), width: 4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 36,
                offset: const Offset(0, 18),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(44),
            child: mobileContent,
          ),
        ),
      ),
    );
  }
}
