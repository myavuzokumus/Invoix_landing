import 'package:flutter/material.dart';

class Features extends StatelessWidget {
  const Features({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FeatureItem(
            title: 'Analyze your Invoices with Ease',
            description: "Doesn't matter how many invoices you have, InvoiX will help you analyze them with ease.",
            imagePath: 'assets/holding_phone.png',
          ),
          FeatureItem(
            title: 'AI-Powered Invoice Analysis',
            description: 'Analyze your invoices with AI to enhance efficiency and accuracy. Utilize AI to gain detailed insights and streamline your invoice processing.',
            imagePath: 'assets/fast_process.png',
          ),
          FeatureItem(
            title: 'Stock Management Made Easy',
            description: 'InvoiX helps you manage your stock with ease. Track your stock levels, set reorder points, and generate reports to make informed decisions.',
            imagePath: 'assets/secure_infrastructure.png',
          ),
        ],
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const FeatureItem({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(imagePath, height: 196),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(description),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Implement action
                  },
                  child: const Text('Learn More'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}