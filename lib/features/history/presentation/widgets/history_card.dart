import 'package:flutter/material.dart';
import 'package:patient/core/config/config.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.defaultPadding),
      decoration: UI.boxDecoration(Theme.of(context).primaryColor, .1),
      child: Column(
        children: [
          const ListTile(
            title: Text("patient address"),
            subtitle: Text("batna fzdis"),
            trailing: Text("Time: 20:20"),
          ),
          const ListTile(
            title: Text("hospital address"),
            subtitle: Text("batna CHU"),
          ),
        ],
      ),
    );
  }
}
