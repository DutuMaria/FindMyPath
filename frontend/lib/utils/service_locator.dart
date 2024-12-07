import 'package:get_it/get_it.dart';

import '../local_storage/storage_service.dart';
import '../local_storage/storage_service_impl.dart';


GetIt serviceLocator = GetIt.asNewInstance();

void setupServiceLocator() {
  serviceLocator.registerLazySingleton<LocalPreferences>(() => LocalPreferencesImpl());
}
