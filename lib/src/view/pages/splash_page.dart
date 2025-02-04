import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/src/view/pages/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen(
        useImmersiveMode: true,
        duration: const Duration(milliseconds: 10000),
        nextScreen: const HomePage(),
        backgroundColor: Colors.black,
        // splashScreenBody: Center(
        //   child: Lottie.asset(
        //     "assets/images/loading.json",
        //     repeat: true,
        //   ),
        // ),

        splashScreenBody: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  // width: 269,
                  // height: 474,
                  // child: Lottie.asset(
                  //   "assets/images/loading.json",
                  //   repeat: true,
                  // ),

                  child: Lottie.asset(
                    "assets/images/loading-2.json",
                    repeat: true,
                  ),
                ),
                Text(
                  'Weather Forecast',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
