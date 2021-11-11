import 'package:flutter/material.dart';

import 'shared.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  // List of Tabs
  final List<Tab> _tabs = [
    const Tab(text: 'General'),
    const Tab(text: 'Sport'),
    const Tab(text: 'Economy'),
    const Tab(text: 'Tech'),
    const Tab(text: 'Health'),
    const Tab(text: 'Music'),
  ];

  // List of TabViews
  final List<Widget> _tabViews = [
    const SharedScreen('General News'),
    const SharedScreen('Sport News'),
    const SharedScreen('Economy News'),
    const SharedScreen('Tech News'),
    const SharedScreen('Health News'),
    const SharedScreen('Music News'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('News Realm'),
            elevation: 0,
            bottom: TabBar(
              unselectedLabelColor: Colors.grey,
              unselectedLabelStyle: const TextStyle(fontSize: 16),
              labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              labelColor: Colors.black,
              indicatorColor: Colors.red,
              isScrollable: true,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: _tabs,
            ),
          ),
          body: TabBarView(
            children: _tabViews,
          )),
    );
  }
}
