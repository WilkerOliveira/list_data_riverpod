import 'package:flutter/foundation.dart';
import 'package:list_data_riverpod/modules/properties/data/datasources/properties_datasource.dart';
import 'package:list_data_riverpod/modules/properties/data/models/property_model.dart';
import 'package:list_data_riverpod/modules/properties/domain/entities/property_entity.dart';
import 'package:list_data_riverpod/modules/properties/domain/repositories/properties_repository.dart';

class PropertiesRepositoryImpl implements PropertiesRepository {
  final PropertiesDatasource datasource;

  PropertiesRepositoryImpl(this.datasource);

  @override
  Future<List<PropertyEntity>> getProperties() async {
    final result = await datasource.getProperties();

    return compute(_parseMap, result);
  }

  static List<PropertyEntity> _parseMap(List<dynamic> items) {
    return items.map((e) => PropertyModel.fromJson(e).toEntity()).toList();
  }
}
