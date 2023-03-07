import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient/core/config/config.dart';
import 'package:patient/core/widgets/widgets.dart';

import '../../../history/presentation/views/history_screen.dart';
import '../../../service/presentation/views/service_screen.dart';
import '../state/providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const screens = [ServiceScreen(), HistoryScreen()];

    final int screenIndex = ref.watch(selectedScreenIndex);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.maxFinite, 50),
        child: CustomAppBar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultPadding),
          child: screens[screenIndex],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}
