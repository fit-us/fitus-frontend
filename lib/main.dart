import 'package:fapp/app_state.dart';
import 'package:fapp/bottom_tab.dart';
import 'package:fapp/bottom_tab_route_observer.dart';
import 'package:flutter/material.dart';
import 'package:fapp/record/record_context.dart';
import 'package:provider/provider.dart';

void main() {
  final appState = AppState();
  final routeObserver = BottomTabRouteObserver(
    onShowBottomTab: (show) {
      appState.setBottomTabVisibility(show);
    },
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: appState),
        ChangeNotifierProvider(create: (_) => RecordContext()),
        Provider.value(value: routeObserver),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitus',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const Home(),
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
