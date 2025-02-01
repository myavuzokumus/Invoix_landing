import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final Function(String) onNavigate;
  final String currentRoute;

  const Footer({super.key, required this.onNavigate, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.grey[900]!,
            Colors.grey[850]!,
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 768) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "assets/images/branding_image.png",
                            height: 72,
                          ),
                          const SizedBox(height: 16),
                          const _CopyrightText(),
                        ],
                      ),
                      _FooterLinks(
                        onNavigate: onNavigate,
                        currentRoute: currentRoute,
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Image.asset(
                        "assets/images/branding_image.png",
                        height: 72,
                      ),
                      const SizedBox(height: 32),
                      _FooterLinks(
                        onNavigate: onNavigate,
                        currentRoute: currentRoute,
                      ),
                      const SizedBox(height: 24),
                      const _CopyrightText(),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _FooterLinks extends StatelessWidget {
  final Function(String) onNavigate;
  final String currentRoute;

  const _FooterLinks({required this.onNavigate, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return Column(  // Wrap yerine Column kullanıyoruz
      crossAxisAlignment: CrossAxisAlignment.center,  // Sağa hizalama
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        Text("Useful links", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        _AnimatedFooterLink(
          title: 'Privacy Policy',
          onTap: () {
            if (currentRoute != '/privacy') onNavigate('/privacy');
          },
        ),
        _AnimatedFooterLink(
          title: 'Terms of Service',
          onTap: () {
            if (currentRoute != '/terms') onNavigate('/terms');
          },
        ),
        _AnimatedFooterLink(
          title: 'Delete Account',
          onTap: () {
            if (currentRoute != '/delete-account') onNavigate('/delete-account');
          },
        ),
      ],
    );
  }
}

class _AnimatedFooterLink extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _AnimatedFooterLink({
    required this.title,
    required this.onTap,
  });

  @override
  State<_AnimatedFooterLink> createState() => _AnimatedFooterLinkState();
}

class _AnimatedFooterLinkState extends State<_AnimatedFooterLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: _isHovered ? Colors.white.withValues(alpha: 0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              color: _isHovered ? Colors.white : Colors.grey[300],
              fontSize: 15,
              fontWeight: _isHovered ? FontWeight.w500 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

class _CopyrightText extends StatelessWidget {
  const _CopyrightText();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        '© ${DateTime.now().year} InvoiX. All rights reserved.',
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 13,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}