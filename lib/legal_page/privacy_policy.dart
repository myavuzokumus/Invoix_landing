import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:invoix_landing/loading_status.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  Future<String> _loadPrivacyPolicy() async {
    return await rootBundle.loadString('assets/pages/privacy_policy.md');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadPrivacyPolicy(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingAnimation(
            message: 'Loading privacy policy...',
            customHeight: MediaQuery.of(context).size.height / 1.5,
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading privacy policy'));
        } else {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Privacy Policy',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Markdown(
                  shrinkWrap: true,
                  selectable: true,
                  data: snapshot.data ?? '',
                ),
              ],
            ),
          );
        }
      },
    );
  }
}