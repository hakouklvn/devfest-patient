// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../state/providers.dart';

// class CustomBottomNavigation extends ConsumerWidget {
//   const CustomBottomNavigation({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final int screenIndex = ref.watch(selectedScreenIndex);
//     final locale = AppLocalizations.of(context)!;

//     return Row(
//       children: [
//         Expanded(
//           child: NavigationButton(
//             press: () {
//               ref.read(selectedScreenIndex.notifier).update((state) => 0);
//             },
//             name: locale.manage_orders,
//             color: screenIndex == 0 ? Theme.of(context).cardColor : null,
//             iconData: screenIndex == 0 ? Icons.shopping_bag : null,
//           ),
//         ),
//         const SizedBox(width: Sizes.defaultPadding),
//         Expanded(
//           child: NavigationButton(
//             press: () {
//               ref.read(selectedScreenIndex.notifier).update((state) => 1);
//             },
//             name: locale.products,
//             color: screenIndex == 1 ? Theme.of(context).cardColor : null,
//             iconData: screenIndex == 1 ? Icons.food_bank_rounded : null,
//           ),
//         ),
//       ],
//     );
//   }
// }
