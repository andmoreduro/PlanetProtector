import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'components/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: 'https://ldktibaeyhdcdvqrcmev.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxka3RpYmFleWhkY2R2cXJjbWV2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTI1MjY5MjIsImV4cCI6MjAyODEwMjkyMn0.TLFAASE8gWUHmilg-SbrGahzWYKI-R-a34EdT1djZAo',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'Planet Protector',
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
    );
  }
}