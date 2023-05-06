import 'package:canto_cards_game/home/home_controller.dart';
import 'package:canto_cards_game/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.init();
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "images/splash-screen.gif",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.5),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: Duration(seconds: 2),
                  builder: (_, double value, __) {
                    return Opacity(
                      opacity: value,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "The Blackout",
                            style: TextStyle(
                              fontSize: 40,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Last Hope on Canto",
                            style: TextStyle(
                              fontSize: 24,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => Get.toNamed('${Routes.gameLobby}?userId=3'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text("Enter lobby"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
