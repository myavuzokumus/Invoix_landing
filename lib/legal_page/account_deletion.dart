import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AccountDeletionPage extends StatelessWidget {
  const AccountDeletionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Account Deletion Instructions',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Markdown(
            shrinkWrap: true,
            selectable: true,
            data: '''
If you wish to delete your InvoiX account, please follow these steps:

1. Log in to your InvoiX account
2. Navigate to Account Settings
3. Scroll to the bottom and click on "Delete Account"
4. Read the information about account deletion carefully
5. If you're sure, click "Confirm Deletion"

**Please note:** Account deletion is permanent and cannot be undone. All your data will be permanently removed from our systems.

If you have any issues or need assistance with account deletion, please contact our support team at support@sc-riber.games.

## What happens when you delete your account?

- Your account and all associated data will be permanently deleted
- You will no longer have access to any of your invoices or client information
- Any recurring invoices or scheduled payments will be cancelled
- Your username will be released and may become available for others to use

**Note:** To prevent abuse of free usage rights, only your email address and account creation date will be retained for 1 year after account deletion.

## Alternatives to account deletion

If you're considering deleting your account due to concerns or issues, please consider the following alternatives:

- **Contact our support team:** We may be able to address your concerns or resolve any issues you're experiencing.
- **Adjust your notification settings:** If you're receiving too many emails, you can customize your notification preferences.

Remember, once your account is deleted, it cannot be recovered. If you're sure you want to proceed with account deletion, follow the steps outlined above.
''',
          ),
        ],
      ),
    );
  }
}
