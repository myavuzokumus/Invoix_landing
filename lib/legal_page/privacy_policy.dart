import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Privacy Policy',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 16),
        Markdown(
          shrinkWrap: true,
          selectable: true,
          data: '''
*Last updated: October 14, 2024*

This Privacy Policy describes how InvoiX ("we", "us", or "our") collects, uses, and discloses your personal information when you use our application and services.

## 1. Information We Collect

We collect information that you provide directly to us, such as when you create an account, use our services, or contact us for support.

## 2. How We Use Your Information

We use the information we collect to provide, maintain, and improve our services, to develop new ones, and to protect InvoiX and our users.

## 3. Information Sharing and Disclosure

We do not share personal information with companies, organizations, or individuals outside of InvoiX except in the following cases:

- With your consent
- For external processing
- For legal reasons

## 4. Data Security

We work hard to protect InvoiX and our users from unauthorized access to or unauthorized alteration, disclosure, or destruction of information we hold.

## 5. Changes to This Privacy Policy

We may update this privacy policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.

## 6. Contact Us

If you have any questions about this Privacy Policy, please contact us at support@sc-riber.games.
    ''',
        ),
      ]),
    );
  }
}
