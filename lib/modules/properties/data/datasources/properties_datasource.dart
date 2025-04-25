import 'package:list_data_riverpod/core/connection/client_connection.dart';
import 'package:list_data_riverpod/modules/properties/data/models/property_model.dart';
import 'package:flutter/foundation.dart';

abstract class PropertiesDatasource {
  Future<List<PropertyModel>> getProperties();
}

class PropertiesDatasourceImpl implements PropertiesDatasource {
  final ClientConnection clientConnection;

  PropertiesDatasourceImpl(this.clientConnection);

  @override
  Future<List<PropertyModel>> getProperties() async {
    final response = await clientConnection.get('properties');

    return compute(PropertyModel.fromJsonList, response.data as List);
  }
}
