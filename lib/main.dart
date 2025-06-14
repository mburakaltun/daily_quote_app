import 'package:flutter/material.dart';

import 'authentication/screen/sign_in_screen.dart';
import 'feed/screen/feed_screen.dart';
import 'discover/screen/discover_screen.dart';
import 'liked/screen/liked_screen.dart';
import 'notification/screen/notification_screen.dart';
import 'profile/screen/profile_screen.dart';


void main() {
  runApp(const DailyQuoteApp());
}

class DailyQuoteApp extends StatelessWidget {
  const DailyQuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DailyQuoteApp',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.teal,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: const SignInScreen(), // 👈 Open SignIn first
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    FeedScreen(),
    DiscoverScreen(),
    LikedScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.view_agenda), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Liked'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Alerts'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
