import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/home/presentation/state/providers.dart';

class CustomBottomNavigation extends ConsumerWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int screenIndex = ref.watch(selectedScreenIndex);

    final List destinations = [
      {
        "icon": const Icon(Icons.shopping_cart_checkout),
        "selectedIcon": Icon(Icons.shopping_cart_checkout,
            color: Theme.of(context).iconTheme.color),
        "label": "services",
      },
      {
        "icon": const Icon(Icons.history_rounded),
        "selectedIcon":
            Icon(Icons.history, color: Theme.of(context).iconTheme.color),
        "label": "history"
      }
    ];
    return NavigationBar(
      destinations: destinations
          .map(
            (destination) => NavigationDestination(
              icon: destination["icon"],
              selectedIcon: destination["selectedIcon"],
              label: destination["label"],
            ),
          )
          .toList(),
      onDestinationSelected: (index) =>
          ref.read(selectedScreenIndex.notifier).update((state) => index),
      selectedIndex: screenIndex,
      animationDuration: const Duration(milliseconds: 900),
    );
  }
}
