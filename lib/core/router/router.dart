import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../storage/secure_storage.dart';
import '../../features/auth/presentation/splash_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/dashboard/presentation/vehicle_dashboard_screen.dart';
import '../../features/driver/presentation/driver_pulse_screen.dart';
import '../../features/fleet/presentation/trip_log_screen.dart';
import '../../features/fleet/presentation/devices_screen.dart';
import '../../features/fleet/presentation/vehicle_location_screen.dart';
import '../../features/fleet/presentation/security_control_screen.dart';

// Router Provider
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/driver/dashboard',
        builder: (context, state) => const VehicleDashboardScreen(),
      ),
      GoRoute(
        path: '/driver/pulse',
        builder: (context, state) => const DriverPulseScreen(),
      ),
      GoRoute(
        path: '/fleet/trips',
        builder: (context, state) => const TripLogScreen(),
      ),
       GoRoute(
        path: '/fleet/devices',
        builder: (context, state) => const DevicesScreen(),
      ),
       GoRoute(
        path: '/fleet/location',
        builder: (context, state) => const VehicleLocationScreen(),
      ),
       GoRoute(
        path: '/fleet/security',
        builder: (context, state) => const SecurityControlScreen(),
      ),
    ],
    redirect: (context, state) async {
       // Simple auth guard
       final token = await SecureStorage().getToken();
       final isLoggingIn = state.uri.toString() == '/login';
       final isSplash = state.uri.toString() == '/';

       if (token == null && !isLoggingIn && !isSplash) {
         return '/login';
       }

       if (token != null && (isLoggingIn || isSplash)) {
         return '/driver/dashboard';
       }

       return null;
    },
  );
});
