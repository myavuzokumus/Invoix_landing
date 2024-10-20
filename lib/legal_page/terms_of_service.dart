import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Terms of Service',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Markdown(
            shrinkWrap: true,
            selectable: true,
            data: '''
*Last updated: October 14, 2024*

Please read these Terms of Service ("Terms", "Terms of Service") carefully before using the InvoiX application and services.

## 1. Acceptance of Terms

By accessing or using our services, you agree to be bound by these Terms. If you disagree with any part of the terms, then you may not access our services.

## 2. Changes to Terms

We reserve the right to modify these Terms at any time. We will notify you of any changes by posting the new Terms on this page.

## 3. Access to the Service

We reserve the right to withdraw or amend our service, and any service or material we provide via the service, in our sole discretion without notice.

## 4. Prohibited Uses

You may use our service only for lawful purposes and in accordance with these Terms.

## 5. Intellectual Property Rights

The Service and its original content, features, and functionality are and will remain the exclusive property of InvoiX and its licensors.

## 6. Termination

We may terminate or suspend your access immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms.

## 7. Limitation of Liability

In no event shall InvoiX, nor its directors, employees, partners, agents, suppliers, or affiliates, be liable for any indirect, incidental, special, consequential or punitive damages.

## 8. Governing Law

These Terms shall be governed and construed in accordance with the laws of Europe, without regard to its conflict of law provisions.

## 9. Contact Us

If you have any questions about these Terms, please contact us at support@sc-riber.games.
''',
          ),
        ],
      ),
    );
  }
}
