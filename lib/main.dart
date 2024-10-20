import 'package:flutter/material.dart';
import 'package:invoix_landing/footer.dart';
import 'package:invoix_landing/header.dart';
import 'package:invoix_landing/legal_page/account_deletion.dart';
import 'package:invoix_landing/legal_page/patches.dart';
import 'package:invoix_landing/legal_page/privacy_policy.dart';
import 'package:invoix_landing/legal_page/terms_of_service.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
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
    return MaterialApp(
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
          pageBuilder: (context, animation, secondaryAnimation) => MainLayout(initialRoute: getPage(settings.name ?? "/") is HomePage ? "/" : settings.name ?? "/"),
          settings: settings,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
      },
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
      body: Column(
        children: [
          Header(onNavigate: _navigateTo, currentRoute: _currentRoute),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: Title(color: Theme.of(context).scaffoldBackgroundColor,
                          title: _updateTabTitle(_currentRoute),

                          child: getPage(_currentRoute)),
                        ),
                      ),
                    ),
                  ),
                  Footer(onNavigate: _navigateTo, currentRoute: _currentRoute),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}