import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:invoix_landing/animation.dart';
import 'package:invoix_landing/footer.dart';
import 'package:invoix_landing/header.dart';
import 'package:invoix_landing/legal_page/account_deletion.dart';
import 'package:invoix_landing/legal_page/patches.dart';
import 'package:invoix_landing/legal_page/privacy_policy.dart';
import 'package:invoix_landing/legal_page/terms_of_service.dart';
import 'package:invoix_landing/main_page/home_page.dart';
import 'package:invoix_landing/theme.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const InvoiXWeb());
}

Widget getPage(String route) {
  switch (route) {
    case '/':
      return const HomePage();
    case '/privacy':
      return const PrivacyPolicyPage();
    case '/terms':
      return const TermsOfServicePage();
    case '/delete-account':
      return const AccountDeletionPage();
    case '/patches':
      return const PatchesPage();
    default:
      return const HomePage();
  }
}

class InvoiXWeb extends StatelessWidget {
  const InvoiXWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'InvoiX - Home Page',
        theme: const MaterialTheme(TextTheme()).dark().copyWith(
              visualDensity: VisualDensity.adaptivePlatformDensity,
              inputDecorationTheme: InputDecorationTheme(
                labelStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(150),
                ),
                isDense: true,
                counterStyle: const TextStyle(fontSize: 0),
                errorStyle: const TextStyle(fontSize: 0),
              ),
              listTileTheme: ListTileThemeData(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                tileColor: Colors.grey[850],
                titleTextStyle: const TextStyle(fontSize: 18),
              ),
              expansionTileTheme: const ExpansionTileThemeData(
                shape: Border.symmetric(
                  vertical: BorderSide.none,
                ),
              ),
            ),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => MainLayout(
                initialRoute: getPage(settings.name ?? "/") is HomePage
                    ? "/"
                    : settings.name ?? "/"),
            settings: settings,
          );
        },
      ),
    );
  }
}

class MainLayout extends StatefulWidget {
  final String initialRoute;

  const MainLayout({super.key, required this.initialRoute});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late String _currentRoute;

  @override
  void initState() {
    super.initState();
    if (getPage(widget.initialRoute) is HomePage) {
      _currentRoute = "/";
    } else {
      _currentRoute = widget.initialRoute;
    }
  }

  void _navigateTo(String route) {
    if (getPage(route) is HomePage) {
      setState(() {
        _currentRoute = '/';
      });
      Navigator.of(context).pushNamed('/');
    } else {
      setState(() {
        _currentRoute = route;
      });
      Navigator.of(context).pushNamed(route);
    }
  }

  String _updateTabTitle(String route) {
    switch (route) {
      case '/privacy':
        return 'InvoiX - Privacy';
      case '/terms':
        return 'InvoiX - Terms of Service';
      case '/delete-account':
        return 'InvoiX - Account Deletion';
      default:
        return 'InvoiX - Main Page';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff310700),
      body: Column(
        children: [
          Header(onNavigate: _navigateTo, currentRoute: _currentRoute),
          Expanded(
            child: LampContainer2(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 1200, minHeight: MediaQuery.of(context).size.height / 1.6),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Title(
                              key: ValueKey<String>(_currentRoute),
                              color: Theme.of(context).scaffoldBackgroundColor,
                              title: _updateTabTitle(_currentRoute),
                              child: FadeInWidget(child: getPage(_currentRoute))),
                        ),
                      ),
                    ),
                    Footer(onNavigate: _navigateTo, currentRoute: _currentRoute),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LampContainer2 extends StatelessWidget {
  final Widget child;

  const LampContainer2({
    super.key,
    required this.child,
  });

  @override

  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand, // Stack'in tüm alanı kaplaması için
      alignment: Alignment.center,
      children: [
        // Ana arka plan efektleri
        Animate(
          effects: [
            FadeEffect(
              delay: 300.milliseconds,
              duration: 800.milliseconds,
              begin: 0.5,
              end: 1,
            ),
            CustomEffect(
              delay: 300.milliseconds,
              duration: 800.milliseconds,
              builder: (context, value, child) => Container(
                width: 120 + (value * 240),
                height: 224,
                decoration: BoxDecoration(
                  gradient: SweepGradient(
                    center: Alignment.topCenter,
                    startAngle: 70 * (3.14159 / 279),
                    endAngle: 2 * 3.14159,
                    colors:  [
                      Colors.transparent,
                      Theme.of(context).colorScheme.surface,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        // İçerik
        child
      ],
    );
  }
}
