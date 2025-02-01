import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Download extends StatefulWidget {
  const Download({super.key});

  @override
  State<Download> createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.white, Colors.white.withValues(alpha: 0.8)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bounds),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontSize: isHovered ? 44 : 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.2,
              ),
              child: const Text(
                'Ready to Transform Your Invoice Management?',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 40),
          MouseRegion(
            onEnter: (_) => setState(() => isHovered = true),
            onExit: (_) => setState(() => isHovered = false),
            child: GestureDetector(
              onTap: () async {
                final Uri url = Uri.parse(
                    'https://play.google.com/store/apps/details?id=games.sc_riber.invoix');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform: Matrix4.identity()
                  ..scale(isHovered ? 1.05 : 1.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: isHovered ? 0.3 : 0.2),
                      blurRadius: isHovered ? 20 : 15,
                      offset: Offset(0, isHovered ? 8 : 5),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/images/play_store.png',
                  width: 280,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}