import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:invoix_landing/loading_status.dart';

class PatchesPage extends StatelessWidget {
  const PatchesPage({super.key});

  Future<String> _loadPatches() async {
    return await rootBundle.loadString('assets/pages/patches.md');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadPatches(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingAnimation(
            message: 'Loading patches...',
            customHeight: MediaQuery.of(context).size.height / 1.5,
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading patches'));
        } else {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('InvoiX Changelog',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Markdown(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    selectable: true,
                    data: snapshot.data ?? '',
                    styleSheet: MarkdownStyleSheet(
                      h1: TextStyle(
                        fontFamily: 'Roboto',
                        fontFamilyFallback: ['NotoColorEmoji'],
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      h2: TextStyle(
                        fontFamily: 'Roboto',
                        fontFamilyFallback: ['NotoColorEmoji'],
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      h3: TextStyle(
                        fontFamily: 'Roboto',
                        fontFamilyFallback: ['NotoColorEmoji'],
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      h4: TextStyle(
                        fontFamily: 'Roboto',
                        fontFamilyFallback: ['NotoColorEmoji'],
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      h5: TextStyle(
                        fontFamily: 'Roboto',
                        fontFamilyFallback: ['NotoColorEmoji'],
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      h6: TextStyle(
                        fontFamily: 'Roboto',
                        fontFamilyFallback: ['NotoColorEmoji'],
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      p: TextStyle(
                        fontFamily: 'Roboto',
                        fontFamilyFallback: ['NotoColorEmoji'],
                        fontSize: 14,
                      ),
                      blockquote: TextStyle(
                        fontFamily: 'Roboto',
                        fontFamilyFallback: ['NotoColorEmoji'],
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                      blockquotePadding: EdgeInsets.all(8.0),
                      blockquoteDecoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      listBullet: TextStyle(
                        fontFamily: 'Roboto',
                        fontFamilyFallback: ['NotoColorEmoji'],
                        fontSize: 14,
                      ),
                      code: TextStyle(
                        fontFamily: 'Roboto',
                        fontFamilyFallback: ['NotoColorEmoji'],
                        fontSize: 14,
                        color: Colors.deepOrange,
                      ),
                      codeblockDecoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      codeblockPadding: EdgeInsets.all(8.0),
                      // Link stili
                      a: TextStyle(
                        fontFamily: 'Roboto',
                        fontFamilyFallback: ['NotoColorEmoji'],
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
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