import 'package:homeservice/features/service/data/model/service_model.dart';
import 'package:homeservice/features/service/domain/params/service_param.dart';

abstract interface class ServiceDataSource {
  Future<List<ServiceModel>> fetchServices(ServiceParam params);
  Future<List<ServiceModel>> fetchTopRatedServices();
  Future<ServiceModel> getServiceDetails(String id);
}
