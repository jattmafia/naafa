import 'package:dio/dio.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naafa/core/api_config.dart';


final dioProvider = Provider.autoDispose((ref) => Dio(
      BaseOptions(baseUrl: ApiConfig.baseUrl),
    ));






