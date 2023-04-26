import 'package:canto_cards_game/home/home_screen.dart';
import 'package:canto_cards_game/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'get_bindings.dart';

Future<void> main() async {
  await GetBindings.init();
  await Supabase.initialize(
      url: 'https://jpgrvpbkaxmpzloxxpjo.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpwZ3J2cGJrYXhtcHpsb3h4cGpvIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODI0OTM5NDcsImV4cCI6MTk5ODA2OTk0N30.S0_T5DoafzVvicOmXK5bkouN8OU2l6lenrUqW79__4U');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      getPages: Routes.routes,
    );
  }
}
