import 'package:flutter/material.dart';

import 'news.dart';
import 'search.dart';
import 'settings.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Set the Home screen as first screen
  int _currentIndex = 0;

  // List of screens for bottom navigation bar
  final List<Widget> _screens = [
    const News(),
    const Search(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey.shade600,
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        selectedItemColor: Colors.red,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_rounded),
            label: 'News'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: 'Search'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded),
              label: 'Settings'
          )
        ],
      ),
    );
  }
}
