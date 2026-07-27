import 'package:flutter/material.dart';
import 'package:homeservice/config/injector/injector_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeservice/features/cart/data/model/cart_hive_model.dart';
import 'package:homeservice/providers.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'my_app.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_ce/hive_ce.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(CartHiveModelAdapter());
  await Hive.openBox<CartHiveModel>(dotenv.env['CART_BOX']!);
  await initDependencies(dotenv.env['CART_BOX']!);
  runApp(
    MultiBlocProvider(providers: AppProviders.provider, child: const MyApp()),
  );
}
