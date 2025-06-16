import 'package:daily_quote_app/common/extension/localization_extension.dart';
import 'package:daily_quote_app/discover/screen/discover_screen.dart';
import 'package:daily_quote_app/feed/screen/feed_screen.dart';
import 'package:daily_quote_app/liked/screen/liked_screen.dart';
import 'package:daily_quote_app/notification/screen/notification_screen.dart';
import 'package:daily_quote_app/profile/screen/profile_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens.addAll([
      const FeedScreen(),
      const DiscoverScreen(),
      const LikedScreen(),
      const NotificationScreen(),
      const ProfileScreen()
    ]);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final titles = [
      context.message.dashboardFeed,
      context.message.dashboardDiscover,
      context.message.dashboardLiked,
      context.message.dashboardNotification,
      context.message.dashboardProfile,
    ];

    final navItems = [
      BottomNavigationBarItem(icon: const Icon(Icons.home), label: context.message.dashboardFeed),
      BottomNavigationBarItem(icon: const Icon(Icons.explore), label: context.message.dashboardDiscover),
      BottomNavigationBarItem(icon: const Icon(Icons.favorite), label: context.message.dashboardLiked),
      BottomNavigationBarItem(icon: const Icon(Icons.notifications), label: context.message.dashboardNotification),
      BottomNavigationBarItem(icon: const Icon(Icons.person), label: context.message.dashboardProfile),
    ];


    return Scaffold(
      appBar: AppBar(title: Text(titles[_selectedIndex])),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: navItems,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
