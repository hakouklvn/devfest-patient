import 'package:flutter/material.dart';
import 'package:patient/core/config/config.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Sizes.defaultPadding),
        child: Column(
          children: const [
            NewWidget(),
            SizedBox(height: Sizes.defaultPadding),
            NewWidget(),
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
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
