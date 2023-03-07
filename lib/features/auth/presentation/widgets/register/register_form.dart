import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/auth_state.dart';
import '../../state/providers.dart';
import '../widgets.dart';

class RegisterForm extends ConsumerWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController pageController = PageController(initialPage: 0);

    return Form(
      key: ref.watch(formProvider),
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: const [FirstScreen(), SecondScreen()],
            ),
          ),
          ref.watch<AuthState>(authNotifierProvider).maybeMap(
                initial: (_) => Container(),
                orElse: () => Container(),
                failure: (error) => FormError(errors: [error.failure.message]),
              ),
          Expanded(child: StepsButtons(pageController: pageController)),
        ],
      ),
    );
  }
}
