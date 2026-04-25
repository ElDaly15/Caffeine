import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

/// Safely retrieves an FCM device token.
///
/// On iOS, calling [FirebaseMessaging.getToken] before an APNs token is
/// available throws `[firebase_messaging/apns-token-not-set]`. This helper
/// waits up to ~5s for the APNs token to arrive, returns `null` if it
/// doesn't, and never throws.
Future<String?> getFcmTokenSafe() async {
  try {
    final messaging = FirebaseMessaging.instance;

    if (Platform.isIOS) {
      String? apnsToken = await messaging.getAPNSToken();
      for (var i = 0; i < 5 && apnsToken == null; i++) {
        await Future.delayed(const Duration(seconds: 1));
        apnsToken = await messaging.getAPNSToken();
      }
      if (apnsToken == null) {
        debugPrint('APNs token unavailable, skipping FCM token fetch.');
        return null;
      }
    }

    return await messaging.getToken();
  } catch (e) {
    debugPrint('FCM getToken skipped: $e');
    return null;
  }
}
