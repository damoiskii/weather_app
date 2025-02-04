import 'package:flutter/material.dart';
import 'package:weather_app/src/config/api/weather_api.dart';
import 'package:weather_app/src/config/theme/app_theme.dart';
import 'package:weather_app/src/view/pages/home_page.dart';

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
      // initialRoute:
      //     appSettingsProvider.isUserOnboard() ? '/main' : '/onboarding',
      //routes: routes,
      home: const HomePage(),
      // onGenerateRoute: RouteNavigator.generate,
    );
  }
}
