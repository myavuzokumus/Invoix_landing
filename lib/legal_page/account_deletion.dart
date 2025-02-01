import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:invoix_landing/loading_status.dart';

class AccountDeletionPage extends StatelessWidget {
  const AccountDeletionPage({super.key});

  Future<String> _loadAccountDeletionInstructions() async {
    return await rootBundle.loadString('assets/pages/account_deletion.md');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadAccountDeletionInstructions(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingAnimation(
            message: 'Loading terms of service...',
            customHeight: MediaQuery.of(context).size.height / 1.5,
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading account deletion instructions.'));
        } else {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Account deletion',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Markdown(
                    shrinkWrap: true,
                    selectable: true,
                    physics: const NeverScrollableScrollPhysics(),
                    data: snapshot.data ?? '',
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

}
