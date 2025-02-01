import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Function(String) onNavigate;
  final String currentRoute;

  const Header({super.key, required this.onNavigate, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withValues(alpha: 0.3),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
          BoxShadow(
            color: Theme.of(context).scaffoldBackgroundColor,
            blurRadius: 10,
          ),
        ],
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ResponsiveWidget(
              largeScreen: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        if (currentRoute != '/') {
                          onNavigate('/');
                        }
                      },
                      child: const Image(image: AssetImage('assets/images/logo_banner_new.png'), width: 128),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildNavItems(),
                  ),
                ],
              ),
              smallScreen: Column(
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        if (currentRoute != '/') {
                          onNavigate('/');
                        }
                      },
                      child: const Image(image: AssetImage('assets/images/logo_banner_new.png'), width: 128),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 10,
                      runSpacing: 10,
                      children: _buildNavItems(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildNavItems() {
    return [
      _buildNavItem('Home', '/'),
      //_buildNavItem('Privacy Policy', '/privacy'),
      //_buildNavItem('Terms of Service', '/terms'),
      //_buildNavItem('Delete Account', '/delete-account'),
      _buildNavItem('Patches', '/patches'),
      //const ElevatedButton(onPressed: null, child: Text("Web support soon!"))
    ];
  }

  Widget _buildNavItem(String title, String route) {
    return Stack(
      children: [
        TextButton(
          onPressed: () {
            if (currentRoute != route) {
              onNavigate(route);
            }
          },
          style: TextButton.styleFrom(
            foregroundColor: currentRoute == route ? Colors.white : null,
          ),
          child: Text(title),
        ),
        if (currentRoute == route)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                border: const Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget smallScreen;

  const ResponsiveWidget({
    super.key,
    required this.largeScreen,
    required this.smallScreen,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return largeScreen;
        } else {
          return smallScreen;
        }
      },
    );
  }
}