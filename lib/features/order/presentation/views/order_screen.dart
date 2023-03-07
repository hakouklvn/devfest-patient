import 'package:flutter/material.dart';
import 'package:patient/core/config/config.dart';
import 'package:patient/core/widgets/widgets.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultPadding),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(Sizes.defaultPadding),
                decoration:
                    UI.boxDecoration(Theme.of(context).primaryColor, .1),
                child: const ListTile(
                  title: Text("hakou"),
                  subtitle: Text("guelfen"),
                ),
              ),
              const Spacer(),
              CustomButton(
                press: () {},
                name: "take order",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
