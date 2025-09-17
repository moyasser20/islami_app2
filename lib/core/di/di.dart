import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:islami_app2/core/di/di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async => getIt.init();
