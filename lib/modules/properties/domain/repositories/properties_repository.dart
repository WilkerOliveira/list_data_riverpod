import 'package:list_data_riverpod/modules/properties/domain/entities/property_entity.dart';

abstract class PropertiesRepository {
  Future<List<PropertyEntity>> getProperties();
}
