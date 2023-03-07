import 'package:auto_route/auto_route.dart';

class ScreenNavigator {
  static void resetRoute(context) => AutoRouter.of(context).popUntilRoot();
  static void replaceWith(context, screen) =>
      AutoRouter.of(context).replace(screen);
  static void goto(context, screen) => AutoRouter.of(context).push(screen);
  static void goback(context) => AutoRouter.of(context).pop();
}
