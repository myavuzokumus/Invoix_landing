import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PatchesPage extends StatelessWidget {
  const PatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Patches',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Markdown(
            shrinkWrap: true,
            selectable: true,
            data: '''
# Patch notes for InvoiX app updates:
## Patch 1.5.0
- EN/TR support added.
- Filter screen added.
- Introduction page added. 
- List element design has been changed. 
- Backend migration and control of transactions.
- Currency added.
- Company id added.
- Invoice analysis cache added.
- AI Insights infrastructure added.
- Excel output was switched to isolate structure and application freezing was prevented.
- Profile screen has been added.
- Plans page has been added.
- Settings page has been added.
''',
          ),
        ],
      ),
    );
  }
}
