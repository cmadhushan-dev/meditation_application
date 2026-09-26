import 'package:go_router/go_router.dart';
import 'package:meditation_application/pages/main_screen.dart';
import 'package:meditation_application/router/route_name.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        name: RouteNames.mainPage,
        builder: (context, state) {
          return MainScreen();
        },
      ),
    ],
  );
}
