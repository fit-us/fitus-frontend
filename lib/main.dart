import 'package:fapp/bottom_tab.dart';
import 'package:fapp/pages/emotion-calendar-page.dart';
import 'package:flutter/material.dart';
import 'package:fapp/record/record_context.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => RecordContext(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BioScore Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const Home(),
      routes: {"/emotion-calendar": (context) => EmotionCalendarPage()},
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: const BottomTab(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              // child: Center(child: BioDashboard(data: bioMockData)),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
