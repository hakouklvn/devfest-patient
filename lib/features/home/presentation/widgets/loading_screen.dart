import 'package:flutter/material.dart';
import 'package:patient/core/config/config.dart';
import 'package:patient/core/widgets/skelton.dart';

class HomeScreenLoading extends StatelessWidget {
  const HomeScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultPadding),
          child: buildSkelton(),
        ),
      ),
    );
  }

  Skelton buildSkelton() {
    return Skelton(
      width: double.maxFinite,
      height: 150,
      child: Row(
        children: [
          const Skelton(width: 100),
          const SizedBox(width: Sizes.defaultPadding * 0.4),
          Expanded(
            child: Column(
              children: const [
                Skelton(height: 30),
                SizedBox(height: Sizes.defaultPadding * 0.4),
                Expanded(child: Skelton()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
