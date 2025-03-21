import 'package:flutter/material.dart';
import 'package:invoix_landing/main_page/download.dart';
import 'package:invoix_landing/main_page/faq.dart';
import 'package:invoix_landing/main_page/features.dart';
import 'package:invoix_landing/main_page/product_showcase.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ProductShowcase(),
        Features(),
        FAQ(),
        Download(),
      ],
    );
  }
}