import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Github'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Text('Flutter Github'),
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Search User'),
              onTap: () {
                Navigator.pushNamed(context, '/search_user');
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            )
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.sentiment_satisfied_alt_sharp,
                size: 80.0,
              ),
              SizedBox(height: 16.0),
              Text(
                'Welcome to Flutter Developer Test',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4?.copyWith(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
