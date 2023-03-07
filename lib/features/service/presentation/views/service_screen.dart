import 'package:flutter/material.dart';
import 'package:patient/core/config/config.dart';
import 'package:patient/core/routes/router.gr.dart';
import 'package:patient/core/utils/screen_navigator.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 5,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: Sizes.smallPadding,
        mainAxisSpacing: Sizes.smallPadding,
      ),
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () {
            ScreenNavigator.goto(context, const OrderScreen());
          },
          child: Card(
            color: Theme.of(context).colorScheme.secondary.withOpacity(.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.car_crash),
                Text("Depanage"),
              ],
            ),
          ),
        );
      },
    );
  }
}
