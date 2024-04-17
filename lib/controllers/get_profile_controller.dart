import 'package:get/get.dart';
import 'package:ridenepal/models/profile_details.dart';
import 'package:ridenepal/repo/profile_details_repo.dart';
import 'package:ridenepal/utils/custom_snackbar.dart';

class GetProfileController extends GetxController {
  @override
  void onInit() {
    getAllProfileDetails();
    super.onInit();
  }

  RxBool loading = RxBool(false);
  RxList<ProfileDetails> profileDetails = <ProfileDetails>[].obs;
  void getAllProfileDetails() async {
    loading.value = true;
    await ProfileDetailsRepo.getProfileDetails(
      onSuccess: (allProfileDetails) {
        loading.value = false;
        profileDetails.addAll(allProfileDetails);
      },
      onError: ((message) {
        loading.value = false;
        CustomSnackBar.error(title: "Profile", message: message);
      }),
    );
  }
}
