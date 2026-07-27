enum AppRoute {
  home(path: '/home', pathName: 'home'),
  serviceListings(path: '/services/:id', pathName: 'services'),
  categoryDetails(path: '/category/:id', pathName: 'categoryDetails'),
  cart(path: '/cart', pathName: 'cart'),
  booking(path: '/booking', pathName: 'booking'),
  bookingConfirmation(path: '/booking-confirmation', pathName: 'bookingConfirmation');

  final String path;
  final String pathName;
  const AppRoute({required this.path, required this.pathName});
}