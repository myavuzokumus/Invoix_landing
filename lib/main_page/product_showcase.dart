
import 'package:flutter/material.dart';

class ProductShowcase extends StatelessWidget {
  const ProductShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Discover the Future of Invoicing with InvoiX',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(20), // Yuvarlatma yarıçapı
            child: Image.asset(
              'assets/phone_canvas.png',
              width: 620,
            ),
          ),
        ],
      ),
    );
  }
}