import 'package:homeservice/features/category/presentation/pages/category_details_view.dart';

import 'route_exports.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

class AppRouteConf {
  AppRouteConf._();
  static GoRouter get router => _router;
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static final _router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoute.home.path,
    routes: [
      // Home
      GoRoute(
        path: AppRoute.home.path,
        name: AppRoute.home.pathName,
        pageBuilder: (_, _) => MaterialPage(child: const HomeView()),
      ),

      // Service Listing
      // GoRoute(
      //   path: AppRoute.serviceListings.path,
      //   name: AppRoute.serviceListings.pathName,
      //   pageBuilder: (_, _) => MaterialPage(child: const ServiceCardView()),
      // ),

      // Service Details (with id parameter)
      GoRoute(
        path: AppRoute.categoryDetails.path,
        name: AppRoute.categoryDetails.pathName,
        pageBuilder: (_, state) {
          final id = state.pathParameters['id'] ?? '';
          return MaterialPage(child: CategoryDetailsView(id: id));
        },
      ),

      // Cart
      GoRoute(
        path: AppRoute.cart.path,
        name: AppRoute.cart.pathName,
        pageBuilder: (_, _) => MaterialPage(child: const CartView()),
      ),

      // Booking
      GoRoute(
        path: AppRoute.booking.path,
        name: AppRoute.booking.pathName,
        pageBuilder: (_, _) => MaterialPage(child: const BookingView()),
      ),

      // Booking Confirmation
      GoRoute(
        path: AppRoute.bookingConfirmation.path,
        name: AppRoute.bookingConfirmation.pathName,
        pageBuilder: (_, _) =>
            MaterialPage(child: const BookingConfirmationView()),
      ),
    ],
    errorPageBuilder: (_, state) => MaterialPage(
      child: Scaffold(
        body: Center(child: Text('Page not found: ${state.uri}')),
      ),
    ),
    redirect: (context, state) {
      return null;
    },
  );
}
