import 'package:flutter/material.dart';
import 'package:patient/utils/screen_navigator.dart';
import 'package:patient/views/account_screen.dart';

import '../views/history.dart';
import '../views/home_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    const screens = [HomeScreen(), HistoryScreen()];
    final List destinations = [
      {
        "icon": const Icon(Icons.shopping_cart_checkout),
        "selectedIcon": Icon(Icons.shopping_cart_checkout,
            color: Theme.of(context).iconTheme.color),
        "label": "home",
      },
      {
        "icon": const Icon(Icons.settings_applications_rounded),
        "selectedIcon":
            Icon(Icons.settings, color: Theme.of(context).iconTheme.color),
        "label": "history"
      }
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ScreenService.goto(context, const Account());
          },
          icon: const Icon(Icons.account_circle),
        ),
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: NavigationBar(
        destinations: destinations
            .map(
              (destination) => NavigationDestination(
                icon: destination["icon"],
                selectedIcon: destination["selectedIcon"],
                label: destination["label"],
              ),
            )
            .toList(),
        onDestinationSelected: (index) => setState(() {
          selectedIndex = index;
        }),
        selectedIndex: selectedIndex,
        animationDuration: const Duration(milliseconds: 900),
      ),
    );
  }
}
