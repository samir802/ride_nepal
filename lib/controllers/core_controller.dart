import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ridenepal/views/login_screen.dart';

import '../models/users.dart';
import '../utils/storage_keys.dart';

class CoreController extends GetxController {
  Rx<User?> currentUser = Rxn<User>();
  RxString userToken = "".obs;
  @override
  void onInit() async {
    await loadCurrentUser();
    super.onInit();
  }

  Future<void> loadCurrentUser() async {
    currentUser.value = StorageHelper.getUser();
    userToken.value = StorageHelper.getToken();
  }

  bool isUserLoggedIn() {
    return currentUser.value != null;
  }

  void logOut() async {
    final box = GetStorage();
    await box.write(StorageKeys.USER, null);
    loadCurrentUser();
    Get.offAll(LoginScreen());
  }
}
