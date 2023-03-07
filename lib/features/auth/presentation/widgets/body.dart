import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient/core/config/config.dart';

import '../state/auth_state.dart';
import '../state/providers.dart';

class Body extends ConsumerWidget {
  final Widget screen;
  const Body({super.key, required this.screen});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .1,
              vertical: Sizes.defaultPadding * 2,
            ),
            color: Theme.of(context).cardColor.withOpacity(0.2),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  'assets/images/app-logo.png',
                  width: MediaQuery.of(context).size.width * .6,
                  height: 160,
                ),
              ],
            ),
          ),
          ref.watch<AuthState>(authNotifierProvider).maybeMap(
                initial: (_) => Container(),
                orElse: () => Container(),
                authenticating: (_) => LinearProgressIndicator(
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation(
                    Theme.of(context).primaryColor,
                  ),
                  minHeight: 3,
                ),
              ),
          Container(
            padding: const EdgeInsets.all(Sizes.defaultPadding),
            height: 500,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(Sizes.defaultPadding),
                topLeft: Radius.circular(Sizes.defaultPadding),
              ),
            ),
            child: screen,
          ),
        ],
      ),
    );
  }
}
