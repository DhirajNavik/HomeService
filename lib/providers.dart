import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/injector/injector_config.dart';
import 'l10n/general_stream.dart';

class AppProviders {
  AppProviders._privateConstructor();

  static final provider = [
    BlocProvider(create: (_) => serviceLocater<LocaleCubit>()),
  ];
}
