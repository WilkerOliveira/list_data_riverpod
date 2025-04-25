import 'package:list_data_riverpod/core/di/main_di.dart';
import 'package:list_data_riverpod/modules/properties/domain/entities/property_entity.dart';
import 'package:list_data_riverpod/modules/properties/domain/usecases/get_property_usecase.dart';
import 'package:list_data_riverpod/modules/properties/exceptions/properties_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'properties_controller.g.dart';

enum FilterState { initial, loading, success, error, empty }

@riverpod
class PropertiesController extends _$PropertiesController {
  PropertiesController();

  late GetPropertyUsecase getPropertyUsecase;
  List<PropertyEntity> properties = [];

  @override
  Future<List<PropertyEntity>> build() async {
    getPropertyUsecase = MainDi.I.get<GetPropertyUsecase>();
    return await _fetchProperties();
  }

  Future<List<PropertyEntity>> _fetchProperties() async {
    try {
      final propertiesResponse = await getPropertyUsecase();

      return propertiesResponse.fold(
        (result) {
          return result;
        },
        (error) {
          throw CouldNotFetchPropertiesException(
            'Erro ao consultar as propriedades',
          );
        },
      );
    } catch (e) {
      throw CouldNotFetchPropertiesException(
        'Erro ao consultar as propriedades',
      );
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(_fetchProperties);
  }
}
