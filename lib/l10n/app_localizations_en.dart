// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get language => 'English';

  @override
  String get booking_confirmation => 'Booking Confirmation';

  @override
  String get service_booked => 'Service Booked!';

  @override
  String get your_service_has =>
      'Your service has been confirmed successfully.';

  @override
  String get my_bookings => 'My Bookings';

  @override
  String get go_home => 'Go Home';
}
