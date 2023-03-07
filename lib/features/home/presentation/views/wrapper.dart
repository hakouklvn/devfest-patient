import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home_screen.dart';

class Wrapper extends ConsumerWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const HomeScreen();
    // maybe load some essentials data
    // return Scaffold(
    //   body: SafeArea(
    //     child: Padding(
    //       padding: const EdgeInsets.all(Sizes.defaultPadding),
    //       // child: ref.watch<ShopState>(shopNotifierProvider).maybeMap(
    //       //       orElse: () => Container(),
    //       //       loading: (_) =>
    //       //           const Center(child: CircularProgressIndicator()),
    //       //       noAddress: (_) => const AddressScreen(),
    //       //       notValidated: (_) => const ShopNotValidated(),
    //       //       loaded: (data) {
    //       //         ShopEntity shopEntity = data.shopEntity;

    //       //         Future.microtask(
    //       //           () => ref
    //       //               .read(shopProvider.notifier)
    //       //               .update((state) => shopEntity),
    //       //         );
    //       //         return const HomeScreen();
    //       //       },
    //       //       noShop: (_) => const CreateShopScreen(),
    //       //       failure: (error) => NoInternet(msg: error.failure.message),
    //       //     ),
    //     ),
    //   ),
    // );
  }
}
