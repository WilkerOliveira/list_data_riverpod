import 'package:list_data_riverpod/modules/properties/domain/entities/property_entity.dart';
import 'package:list_data_riverpod/modules/properties/domain/repositories/properties_repository.dart';
import 'package:list_data_riverpod/modules/properties/exceptions/properties_exception.dart';
import 'package:result_dart/result_dart.dart';

abstract class GetPropertyUsecase {
  Future<ResultDart<List<PropertyEntity>, PropertiesException>> call();
}

class GetPropertyUsecaseImpl implements GetPropertyUsecase {
  final PropertiesRepository repository;

  GetPropertyUsecaseImpl(this.repository);

  @override
  Future<ResultDart<List<PropertyEntity>, PropertiesException>> call() async {
    try {
      return Success(await repository.getProperties());
    } on Exception catch (e) {
      return Failure(CouldNotFetchPropertiesException(e.toString()));
    }
  }
}
