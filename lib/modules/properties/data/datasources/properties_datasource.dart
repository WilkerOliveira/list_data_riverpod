import 'package:list_data_riverpod/core/connection/client_connection.dart';

abstract class PropertiesDatasource {
  Future<List<dynamic>> getProperties();
}

class PropertiesDatasourceImpl implements PropertiesDatasource {
  final ClientConnection clientConnection;

  PropertiesDatasourceImpl(this.clientConnection);

  @override
  Future<List<dynamic>> getProperties() async {
    final response = await clientConnection.get('properties');

    return response.data;
  }
}
