import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tabs Page'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.accessibility_new)),
              Tab(icon: Icon(Icons.mail)),
              Tab(icon: Icon(Icons.map)),
              Tab(icon: Icon(Icons.access_alarm)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Icon(Icons.accessibility_new, size: 64)),
            Center(child: Icon(Icons.mail, size: 64)),
            Center(child: Icon(Icons.map, size: 64)),
            Center(child: Icon(Icons.access_alarm, size: 64)),
          ],
        ),
      )

    );
  }
}