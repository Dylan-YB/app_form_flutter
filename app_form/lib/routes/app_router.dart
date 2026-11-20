import 'package:go_router/go_router.dart';
import '../screens/dashboard_screen.dart';
import '../screens/login_screen.dart';
import '../services/auth_service.dart';

GoRouter createRouter(AuthService auth) => GoRouter(
      initialLocation: '/login',
      refreshListenable: auth,
      redirect: (context, state) {
        final atLogin = state.matchedLocation == '/login';
        if (!auth.isLoggedIn && !atLogin) return '/login';
        if (auth.isLoggedIn && atLogin) return '/dashboard';
        return null;
      },
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) => LoginScreen(auth: auth),
        ),
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => DashboardScreen(auth: auth),
        ),
      ],
    );
