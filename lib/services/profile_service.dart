import 'package:maestroni/app/app.locator.dart';
import 'package:maestroni/data/models/user_dto.dart';
import 'package:maestroni/services/api_service.dart';
import 'package:stacked/stacked.dart';

class ProfileService with ListenableServiceMixin {
  ProfileService() {
    getProfile();
    listenToReactiveValues([user]);
  }
  final _apiService = locator<ApiService>();

  ReactiveValue<UserDTO?> user = ReactiveValue<UserDTO?>(null);

  Future<void> getProfile() async {
    final res = await _apiService.remoteDataSource.getMe();
    if (res.isSuccessful) {
      user.value = res.body;
    }
  }
}
