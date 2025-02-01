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
            imagePath: 'assets/images/holding_phone.png',
          ),
          FeatureItem(
            title: 'AI-Powered Invoice Analysis',
            description: 'Analyze your invoices with AI to enhance efficiency and accuracy. Utilize AI to gain detailed insights and streamline your invoice processing.',
            imagePath: 'assets/images/fast_process.png',
          ),
          FeatureItem(
            title: 'Stock Management Made Easy',
            description: 'InvoiX helps you manage your stock with ease. Track your stock levels, set reorder points, and generate reports to make informed decisions.',
            imagePath: 'assets/images/secure_infrastructure.png',
          ),
          FeatureItem(
            title: 'Smart Financial Insights',
            description: 'InvoiX analyzes your invoice data to provide personalized financial insights: Track spending patterns, forecast VAT obligations, analyze product-specific expenses, and identify seasonal trends for better budget planning.',
            imagePath: 'assets/images/pie-chart.png',
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
      margin: const EdgeInsets.only(bottom: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(imagePath, height: 300),
              ),
            ),
          ),
          const SizedBox(width: 60),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Implement action
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
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