import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shino/pages/server_list/server_list.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

late final StreamingSharedPreferences preferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  preferences = await StreamingSharedPreferences.instance;

  runApp(const ProviderScope(child: ShinoApp()));
}

class ShinoApp extends StatelessWidget {
  const ShinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shino",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.lightBlue,
        ),
      ),
      home: const ServerListPage(),
    );
  }
}
