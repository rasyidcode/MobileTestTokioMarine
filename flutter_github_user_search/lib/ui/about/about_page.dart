import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.construction,
                size: 80.0,
              ),
              SizedBox(height: 16.0),
              Text(
                'Underconstruction',
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
