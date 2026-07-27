import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homeservice/config/injector/injector_config.dart';
import 'package:homeservice/core/components/animated_button.dart';
import 'package:homeservice/core/components/common_appbar.dart';
import 'package:homeservice/core/extensions/context_extension.dart';
import 'package:homeservice/core/helpers/decoration.dart';
import 'package:homeservice/core/routes/route_exports.dart';
import 'package:homeservice/core/utils/app_palettes.dart';
import 'package:homeservice/core/utils/dimens.dart';
import 'package:homeservice/core/utils/sizedBox.dart';

class BookingConfirmationView extends StatefulWidget {
  const BookingConfirmationView({super.key});

  @override
  State<BookingConfirmationView> createState() =>
      _BookingConfirmationViewState();
}

class _BookingConfirmationViewState extends State<BookingConfirmationView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Sample booking data
  final Map<String, String> bookingDetails = {
    'Service': 'Premium Home Cleaning',
    'Booking ID': '#BK-2026-0727',
    'Date': 'Monday, 27 July 2026',
    'Time': '09:00 – 12:00',
    'Address': '123 Main St, Apt 4B',
    'Status': 'Confirmed',
  };

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final localization = context.localizations;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: commonAppBar(title: localization.booking_confirmation),
      body: SingleChildScrollView(
        padding: .symmetric(
          horizontal: Dimens.horizontalspacing,
          vertical: Dimens.verticalspacing,
        ),
        child: Column(
          spacing: Dimens.gapX2,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Opacity(
                    opacity: _fadeAnimation.value,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: Dimens.scaleX15,
                          height: Dimens.scaleX15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                Colors.green.withOpacityExt(1),
                                Colors.green.withOpacityExt(0.2),
                              ],
                            ),
                          ),
                          child: Icon(
                            Icons.check,
                            color: Theme.of(context).scaffoldBackgroundColor,
                            size: Dimens.scaleX10,
                          ),
                        ),

                        Positioned(
                          right: -Dimens.scaleX4,
                          bottom: -Dimens.scaleX4,
                          child: Container(
                            width: Dimens.scaleX10,
                            height: Dimens.scaleX10,
                            decoration: BoxDecoration(
                              color: context.scaffoldBackgroundColor
                                  .withOpacityExt(0.15),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Positioned(
                          left: -Dimens.scaleX4,
                          top: -Dimens.scaleX4,
                          child: Container(
                            width: Dimens.scaleX10,
                            height: Dimens.scaleX10,
                            decoration: BoxDecoration(
                              color: context.scaffoldBackgroundColor
                                  .withOpacityExt(0.15),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            // Title
            FadeTransition(
              opacity: _fadeAnimation,
              child: Text(
                localization.service_booked,
                style: textTheme.displayMedium?.copyWith(fontWeight: .w700),
              ),
            ),
            FadeTransition(
              opacity: _fadeAnimation,
              child: Row(
                mainAxisAlignment: .center,
                children: [
                  Flexible(
                    child: Text(
                      localization.your_service_has,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: .w600,
                        color: AppPalettes.textSecondary,
                      ),

                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizeBox.sizeHX2,

            FadeTransition(
              opacity: _fadeAnimation,
              child: Container(
                decoration: boxDecorationRoundedWithShadow(
                  Dimens.radiusX4,
                  backgroundColor: context.cardColor,
                ),
                padding: .all(Dimens.allPaddingX5),
                child: Column(
                  spacing: Dimens.gapX3,
                  children: bookingDetails.entries.map((entry) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            entry.key,
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppPalettes.textSecondary,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text(
                            entry.value,
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: .symmetric(
          horizontal: Dimens.horizontalspacing,
          vertical: Dimens.verticalspacing,
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Row(
            spacing: Dimens.gapX4,
            children: [
              Expanded(
                child: CommonButton(
                  text: localization.my_bookings,
                  onTap: () => AppRouteConf.rootNavigatorKey.currentState
                      ?.popUntil((route) => route.isFirst),
                  radius: Dimens.radiusX4,
                  borderColor: AppPalettes.primaryColor,
                  color: AppPalettes.whiteColor,
                  textColor: AppPalettes.textPrimary,
                ),
              ),
              Expanded(
                child: CommonButton(
                  onTap: () => AppRouteConf.rootNavigatorKey.currentState
                      ?.popUntil((route) => route.isFirst),
                  text: localization.go_home,
                  radius: Dimens.radiusX4,
                  color: AppPalettes.checkColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
