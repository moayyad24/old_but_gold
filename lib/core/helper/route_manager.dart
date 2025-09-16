import 'package:old_but_gold/core/constants/db_keys.dart';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/core/helper/shared_preference.dart';

bool isLoggedInUser = true;

class RouteManager {
  static Future<void> getInitialRoute() async {
    // Check for token existence
    final token = await getIt<LocalStorageService>().getSecuredString(
      DbKeys.userToken,
    );

    if (token != null) {
      isLoggedInUser = true;
    }
  }
}
