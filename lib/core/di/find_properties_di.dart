import 'package:list_data_riverpod/core/connection/client_connection.dart';
import 'package:list_data_riverpod/core/di/main_di.dart';
import 'package:list_data_riverpod/modules/properties/data/datasources/properties_datasource.dart';
import 'package:list_data_riverpod/modules/properties/data/repositories/properties_repository_impl.dart';
import 'package:list_data_riverpod/modules/properties/domain/repositories/properties_repository.dart';
import 'package:list_data_riverpod/modules/properties/domain/usecases/get_property_usecase.dart';

abstract class FindPropertiesDi {
  static void setup() {
    _setupExtras();
    _setupDataSources();
    _setupRepositories();
    _setupUsecases();
    _setupCubits();
  }

  static void _setupExtras() {
    MainDi.I.registerLazySingleton<ClientConnection>(
      () => ClientConnectionImpl(),
    );
  }

  static void _setupDataSources() {
    MainDi.I.registerLazySingleton<PropertiesDatasource>(
      () => PropertiesDatasourceImpl(MainDi.I.get<ClientConnection>()),
    );
  }

  static void _setupRepositories() {
    MainDi.I.registerLazySingleton<PropertiesRepository>(
      () => PropertiesRepositoryImpl(MainDi.I.get<PropertiesDatasource>()),
    );
  }

  static void _setupUsecases() {
    MainDi.I.registerLazySingleton<GetPropertyUsecase>(
      () => GetPropertyUsecaseImpl(MainDi.I.get<PropertiesRepository>()),
    );
  }

  static void _setupCubits() {
    // MainDi.I.registerFactory<PropertiesProvider>(
    //   () => PropertiesProvider(MainDi.I.get<GetPropertyUsecase>()),
    // );
  }
}
