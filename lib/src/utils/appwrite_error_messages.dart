import 'package:flutter/foundation.dart' show debugPrint;

String appwriteErrorMessage(String? type) {
  debugPrint('appwriteErrorMessage: $type');
  switch (type) {
    case 'user_already_exists':
      return 'A user with this email already exists.';
    case 'user_phone_already_exists':
      return 'A user with this phone number already exists.';

    default:
      return 'Something went wrong.';
  }
}
