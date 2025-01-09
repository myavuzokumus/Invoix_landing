import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Download extends StatelessWidget {
  const Download({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Download now!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () async {
              final Uri url = Uri.parse('https://play.google.com/store/apps/details?id=games.sc_riber.invoix');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Image.asset(
              'assets/images/play_store.png',
              width: 256,
            ),
          ),
        ],
      ),
    );
  }
}