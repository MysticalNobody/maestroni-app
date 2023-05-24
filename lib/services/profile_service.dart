import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/data/models/user_dto.dart';
import 'package:maestroni/services/api_service.dart';

class ProfileService {
  final _apiService = locator<ApiService>();

  UserDTO? user;

  Future<void> getProfile() async {
    final res = await _apiService.remoteDataSource.getMe();
    if (res.isSuccessful) {
      user = res.body;
    }
  }
}
