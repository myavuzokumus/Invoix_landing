import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:invoix_landing/loading_status.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  Future<String> _loadTermsOfService() async {
    return await rootBundle.loadString('assets/pages/terms_of_service.md');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadTermsOfService(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingAnimation(
            message: 'Loading terms of service...',
            customHeight: MediaQuery.of(context).size.height / 1.5,
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading terms of service'));
        } else {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Terms of Service',
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