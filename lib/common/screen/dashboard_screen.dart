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
    final navItems = [
      BottomNavigationBarItem(icon: const Icon(Icons.home), label: context.message.dashboardFeed),
      BottomNavigationBarItem(icon: const Icon(Icons.explore), label: context.message.dashboardDiscover),
      BottomNavigationBarItem(icon: const Icon(Icons.favorite), label: context.message.dashboardLiked),
      BottomNavigationBarItem(icon: const Icon(Icons.notifications), label: context.message.dashboardNotification),
      BottomNavigationBarItem(icon: const Icon(Icons.person), label: context.message.dashboardProfile),
    ];

    return Scaffold(
      appBar: _buildAppBar(),
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

  PreferredSizeWidget _buildAppBar() {
    switch (_selectedIndex) {
      case 0: // Feed Screen
        return AppBar(
          elevation: 0,
          title: Row(
            children: [
              Icon(
                Icons.format_quote,
                color: Theme.of(context).primaryColor,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                context.message.dashboardFeed,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.titleLarge?.color,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Implement search functionality
              },
            ),
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                // Implement refresh functionality
              },
            ),
          ],
        );

      case 1: // Discover Screen
        return AppBar(
          elevation: 0,
          title: Text(
            context.message.dashboardDiscover,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.titleLarge?.color,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Implement search functionality
              },
            ),
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {
                // Implement filter functionality
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryChip('All', true),
                    _buildCategoryChip('Popular', false),
                    _buildCategoryChip('Latest', false),
                    _buildCategoryChip('Authors', false),
                    _buildCategoryChip('Topics', false),
                  ],
                ),
              ),
            ),
          ),
        );

      case 2: // Liked Screen
        return AppBar(
          elevation: 0,
          title: Text(
            context.message.dashboardLiked,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.titleLarge?.color,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {
                // Implement filter functionality
              },
            ),
          ],
        );

      case 3: // Notification Screen
        return AppBar(
          elevation: 0,
          title: Text(
            context.message.dashboardNotification,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.titleLarge?.color,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.done_all),
              onPressed: () {
                // Mark all as read
              },
            ),
          ],
        );

      case 4: // Profile Screen
        return AppBar(
          elevation: 0,
          title: Text(
            context.message.dashboardProfile,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.titleLarge?.color,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Navigate to settings
              },
            ),
          ],
        );

      default:
        return AppBar(
          elevation: 0,
          title: Text(context.message.dashboardFeed),
        );
    }
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Theme.of(context).textTheme.bodyMedium?.color,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        backgroundColor: isSelected ? Theme.of(context).primaryColor : Theme.of(context).chipTheme.backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}