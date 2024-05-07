import 'package:final_project/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ulhllyxblihnzwlrsaww.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVsaGxseXhibGlobnp3bHJzYXd3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQyNDk5MTAsImV4cCI6MjAyOTgyNTkxMH0.VOU1w8guCeK3vr3OGqnLjTrCs76dnRmJTlQ7vSCPQYQ',
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
