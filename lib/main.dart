import 'package:flutter/material.dart';
import 'package:planet_protector/pages/main_page.dart';
import 'package:planet_protector/pages/organization_register_page.dart';
import 'package:planet_protector/pages/person_register_page.dart';
import 'package:planet_protector/pages/supabase_test_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth/register_page_switcher.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: 'urlhttps://ldktibaeyhdcdvqrcmev.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxka3RpYmFleWhkY2R2cXJjbWV2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTI1MjY5MjIsImV4cCI6MjAyODEwMjkyMn0.TLFAASE8gWUHmilg-SbrGahzWYKI-R-a34EdT1djZAo'
  );

  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Planet Protector',
//       debugShowCheckedModeBanner: false,
//       home: SupabaseTestPage(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Countries',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _future = Supabase.instance.client
      .from('countries')
      .select();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final countries = snapshot.data!;
          return ListView.builder(
            itemCount: countries.length,
            itemBuilder: ((context, index) {
              final country = countries[index];
              return ListTile(
                title: Text(country['name']),
              );
            }),
          );
        },
      ),
    );
  }
}