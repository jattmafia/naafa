
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_repository.g.dart';

final authRepositoryProvider =
    Provider((ref) => AuthRepository(ref.read(dioProvider)));


 @RestApi()   
 abstract class AuthRepository {
  factory AuthRepository(Dio dio) = _AuthRepository;
  
  @POST('login')
  Future login( @Field() String userName,
    @Field() String password,);
  
  @POST('signup')
  Future signup( @Field() String userName,
    @Field() String password,
    @Field() String email,
    @Field() String phone,
    @Field() String address,);



}
  
  