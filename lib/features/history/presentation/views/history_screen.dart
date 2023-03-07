import 'package:flutter/material.dart';
import 'package:patient/core/config/config.dart';

import '../widgets/history_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        HistoryCard(),
        SizedBox(height: Sizes.defaultPadding),
        HistoryCard(),
      ],
    );
  }
}
