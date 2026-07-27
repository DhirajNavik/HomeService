import 'package:homeservice/core/dio/network_requester.dart';
import 'package:homeservice/core/utils/app_urls.dart';
import 'package:homeservice/features/service/data/model/service_model.dart';
import 'package:homeservice/features/service/data/datasource/service_datasource.dart';
import 'package:homeservice/features/service/domain/params/service_param.dart';

class ServiceDio implements ServiceDataSource {
  final NetworkRequester _network;

  const ServiceDio(this._network);

  @override
  Future<List<ServiceModel>> fetchServices(ServiceParam params) async {
    final response = await _network.get(
      "${URLs.services}/${params.categoryID}",
    );

    return (response['data'] as List)
        .map((e) => ServiceModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<ServiceModel>> fetchTopRatedServices() async {
    final response = await _network.get(URLs.topRatedServices);

    return (response['data'] as List)
        .map((e) => ServiceModel.fromJson(e))
        .toList();
  }

  @override
  Future<ServiceModel> getServiceDetails(String id) async {
    final response = await _network.get("${URLs.serviceDetails}/$id");

    return ServiceModel.fromJson(response['data']);
  }
}
