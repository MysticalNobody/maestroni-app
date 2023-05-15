import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/services/api_service.dart';

class ProfileService {
  final _apiService = locator<ApiService>();

  Future<void> getProfile() async {
    final res = await _apiService.remoteDataSource.getMe();
    if (res.isSuccessful) {
      final a = res;
    }
  }
}
