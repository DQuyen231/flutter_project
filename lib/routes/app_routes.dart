import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_middle_transportation/presentation/screens/login_page.dart';
import 'package:laundry_middle_transportation/presentation/screens/splash_screen.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: '/login',
            builder: (BuildContext context, GoRouterState state) {
              return LoginPage();
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'details',
                builder: (BuildContext context, GoRouterState state) {
                  return const Placeholder();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
