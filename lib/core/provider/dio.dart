import 'package:dio/dio.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naafa/core/api_config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


final dioProvider = Provider.autoDispose((ref) => Dio(
      BaseOptions(baseUrl: ApiConfig.baseUrl),
      
    )..config(ref));

extension DioException on Dio {
  void config(Ref ref) {
    interceptors.add(PrettyDioLogger());
  }
}




