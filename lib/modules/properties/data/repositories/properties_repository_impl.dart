import 'package:list_data_riverpod/modules/properties/data/datasources/properties_datasource.dart';
import 'package:list_data_riverpod/modules/properties/domain/entities/property_entity.dart';
import 'package:list_data_riverpod/modules/properties/domain/repositories/properties_repository.dart';
import 'package:list_data_riverpod/modules/properties/exceptions/properties_exception.dart';
import 'package:result_dart/result_dart.dart';

class PropertiesRepositoryImpl implements PropertiesRepository {
  final PropertiesDatasource datasource;

  PropertiesRepositoryImpl(this.datasource);

  @override
  Future<ResultDart<List<PropertyEntity>, PropertiesException>>
  getProperties() async {
    try {
      final result = await datasource.getProperties();

      return Success(result.map((e) => e.toEntity()).toList());
    } on Exception catch (e) {
      return Failure(CouldNotFetchPropertiesException(e.toString()));
    }
  }
}
