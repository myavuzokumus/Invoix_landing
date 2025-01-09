import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final Function(String) onNavigate;
  final String currentRoute;

  const Footer({super.key, required this.onNavigate, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[800],
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 10,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (currentRoute != '/privacy') {
                          onNavigate('/privacy');
                        }
                      },
                      child: const Text('Privacy Policy', style: TextStyle(color: Colors.white)),
                    ),
                    TextButton(
                      onPressed: () {
                        if (currentRoute != '/terms') {
                          onNavigate('/terms');
                        }
                      },
                      child: const Text('Terms of Service', style: TextStyle(color: Colors.white)),
                    ),
                    TextButton(
                      onPressed: () {
                        if (currentRoute != '/delete-account') {
                          onNavigate('/delete-account');
                        }
                      },
                      child: const Text('Delete Account', style: TextStyle(color: Colors.white)),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Image.asset("assets/images/branding_image.png", height: 72),
                Text(
                  '© ${DateTime.now().year} InvoiX. All rights reserved.',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}