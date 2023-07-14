import 'package:api_test_2/design/pages/home.dart';
import 'package:api_test_2/design/pages/user_details_page.dart';
import 'package:api_test_2/design/pages/user_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/users',
      name: '/users',
      builder: (context, state) => const UserPage(),
    ),
    GoRoute(
      path: '/details/:id',
      name: '/details',
      builder: (context, state) {
        return UserDetailsPage(id: int.parse(state.pathParameters['id']!));
      },
    ),
  ],
);
