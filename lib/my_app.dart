import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "./core/routes/app_route_conf.dart";
import "./core/themes/app_theme.dart";
import 'l10n/localizations_exports.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(384, 832),
      minTextAdapt: true,
      ensureScreenSize: true,
      splitScreenMode: true,
      fontSizeResolver: FontSizeResolvers.radius,
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp.router(
            locale: locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.lightTheme,
            routerConfig: AppRouteConf.router,
          );
        },
      ),
    );
  }
}
