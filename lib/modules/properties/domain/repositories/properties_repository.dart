import 'package:list_data_riverpod/modules/properties/domain/entities/property_entity.dart';
import 'package:list_data_riverpod/modules/properties/exceptions/properties_exception.dart';
import 'package:result_dart/result_dart.dart';

abstract class PropertiesRepository {
  Future<ResultDart<List<PropertyEntity>, PropertiesException>> getProperties();
}
