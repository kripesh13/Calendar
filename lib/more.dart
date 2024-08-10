import 'package:flutter/material.dart';
import 'package:test/home/home_screen.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return HomeScreen(
                      title: 'Home',
                    );
                  },
                ));
              },
              icon: Icon(Icons.home)),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return HomeScreen(
                      title: 'Settings',
                    );
                  },
                ));
              },
              icon: Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return HomeScreen(
                      title: 'person',
                    );
                  },
                ));
              },
              icon: Icon(Icons.person))
        ],
      ),
    );
  }
}
