import 'package:flutter/material.dart';
import 'package:weather_app/src/config/api/weather_api.dart';
import 'package:weather_app/src/config/theme/app_theme.dart';
import 'package:weather_app/src/view/pages/home_page.dart';
import 'package:weather_app/src/view/pages/splash_page.dart';

void main() {
  WeatherAPI.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forecast App',

      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // themeMode: appSettingsProvider.themeMode,
      initialRoute: '/',
      routes: {
        // '/main': (context) => HomePage(),
        // '/onboarding': (context) => OnboardingPage(),
        // '/settings': (context) => SettingsPage(),
        // '/favorites': (context) => FavoritesPage(),
        // '/weather/:city': (context) => WeatherDetailsPage(city: context.parameters['city']),
        // '/search': (context) => SearchPage(),
        // '/about': (context) => AboutPage(),
        // '/error': (context) => ErrorPage(),
        // '/terms': (context) => TermsPage(),
        // '/privacy': (context) => PrivacyPage(),
        // '/contact': (context) => ContactPage(),
        // '/help': (context) => HelpPage(),
        // '/feedback': (context) => FeedbackPage(),
        // '/weather-units': (context) => WeatherUnitsPage(),

        '/': (context) => const SplashPage(),
        'home': (context) => const HomePage(),
      },
      // home: const HomePage(),
      // onGenerateRoute: RouteNavigator.generate,
    );
  }
}
