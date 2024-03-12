import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:ridenepal/controllers/core_controller.dart';

import 'views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const RideNepal());
}

class RideNepal extends StatelessWidget {
  const RideNepal({super.key});

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
      publicKey: "test_public_key_cff61fbb14274832b909e6a8019a4817",
      builder: (context, navigatorKey) {
        return GetMaterialApp(
          navigatorKey: navigatorKey,
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ne', 'NP'),
          ],
          localizationsDelegates: const [
            KhaltiLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          title: 'Ride Nepal',
          theme: ThemeData(
            useMaterial3: true,
          ),
          initialBinding: BindingsBuilder(() {
            Get.put(CoreController());
          }),
          home: SplashScreen(),
        );
      },
    );
  }
}
