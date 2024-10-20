import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {
  const FAQ({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double horizontalPadding = screenWidth > 600 ? 256 : 64;

    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 40),
      children: const [
        Text('FAQ', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
        ExpansionTile(
          title: Text('What is InvoiX?', textAlign: TextAlign.center),
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Text('InvoiX is an AI-powered invoice analysis tool designed to streamline and optimize your invoice management process.'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('How does it work?', textAlign: TextAlign.center),
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Text('InvoiX works by providing an intuitive interface that leverages AI to analyze and optimize your invoice management process.'),
            ),
          ],
        ),
        // Add more FAQ items as needed
      ],
    );
  }
}