import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

final supabase = Supabase.instance.client;

class _MainPageState extends State<MainPage> {
  final _offerStream = supabase.from('offer').stream(primaryKey: ['id']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: _offerStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Icon( Icons.more_horiz,
                size: 200,
                color: Theme.of(context).highlightColor,
              ),
            );
          }
          final offers = snapshot.data!;
          return ListView.builder(
            itemCount: offers.length,
            itemBuilder: (context, index) {
              final offer = offers[index];
              return ListTile(
                title: Container(
                  height: 110,
                  decoration: BoxDecoration(
                    color: Theme.of(context).highlightColor,
                    // borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Placeholder(
                        fallbackHeight: 110,
                        fallbackWidth: 110,
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text( offer['title'],
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Flexible(
                              child: Text( 'Esta es la descripción de la publicación, y qué más, qué más, qué más, dice la gente. Jajajajajaj, muy largo, muy largo, muy largo, muy largo, muy largo, muy largo, muy largo',
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                  fontSize: 12,
                                )
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
                // title: Text( offer['title']),
              );
            },
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    shape: const CircleBorder(),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {},
                      child: const Icon( Icons.account_circle_rounded,
                        size: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text( 'Iniciar sesión'),
              onTap: () {},
            ),
            ListTile(
              title: const Text( 'Registrarse'),
              onTap: () => context.goNamed('person_register'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed('publication');
        },
        child: const Icon( Icons.add),
      ),
    );
  }
}