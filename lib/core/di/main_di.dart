import 'package:get_it/get_it.dart';

class MainDi {
  static final MainDi _intance = MainDi._internal();

  static MainDi get I => _intance;

  MainDi._internal();

  void registerFactory<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
  }) {
    GetIt.I.registerFactory(factoryFunc, instanceName: instanceName);
  }

  void registerSingleton<T extends Object>(T instance, {String? instanceName}) {
    GetIt.I.registerSingleton(instance, instanceName: instanceName);
  }

  void registerLazySingleton<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
  }) {
    GetIt.I.registerLazySingleton(factoryFunc, instanceName: instanceName);
  }

  T get<T extends Object>({String? instanceName}) {
    return GetIt.I.get<T>(instanceName: instanceName);
  }
}
