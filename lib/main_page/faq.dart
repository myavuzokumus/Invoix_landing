import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {
  const FAQ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        children: [
          const Text(
            'Frequently Asked Questions',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: ListView(
              shrinkWrap: true,
              children: [
                _buildFAQItem(
                  'What is InvoiX?',
                  'InvoiX is an AI-powered invoice analysis tool designed to streamline and optimize your invoice management process.',
                ),
                _buildFAQItem(
                  'How does it work?',
                  'InvoiX works by providing an intuitive interface that leverages AI to analyze and optimize your invoice management process.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              answer,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  const _FAQItem({
    required this.question,
    required this.answer,
  });

  @override
  State<_FAQItem> createState() => _FAQItemState();
}

class _FAQItemState extends State<_FAQItem> {
  bool isHovered = false;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        transform: Matrix4.identity()..translate(0, isHovered ? -2 : 0),
        child: Card(
          elevation: isHovered ? 4 : 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ExpansionTile(
            onExpansionChanged: (expanded) {
              setState(() => isExpanded = expanded);
            },
            title: Text(
              widget.question,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isHovered || isExpanded ? Colors.blue.shade700 : Colors.black87,
              ),
            ),
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(16),
                child: Text(
                  widget.answer,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.6,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}