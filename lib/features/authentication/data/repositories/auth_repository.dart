
import 'package:injectable/injectable.dart';
import 'package:marketmind/features/authentication/data/service/auth_service.dart';

@lazySingleton
class AuthRepository {
  final AuthService apiService;

  AuthRepository(this.apiService);
  //
  // Future<UserDto?> getUserById() async {
  //   try {
  //     final user = await apiService.getUser();
  //     return user;
  //   }
  //   on DioException catch(e){
  //     print('dio-exception -> ${e.error} -> ${e.response?.statusCode} -> ${e.response?.statusMessage}');
  //     return null;
  //   }
  //   catch (e) {
  //     // Handle errors or wrap them
  //     rethrow;
  //   }
  // }
}
