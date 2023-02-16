import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD6Mf9Qindv6XfzZ7-jxRoHYuY7GYKprQ4",
            authDomain: "minutemathfirebase.firebaseapp.com",
            projectId: "minutemathfirebase",
            storageBucket: "minutemathfirebase.appspot.com",
            messagingSenderId: "212760180785",
            appId: "1:212760180785:web:9814161d53129f0ec4bd10",
            measurementId: "G-QRMCNE49CR"));
  } else {
    await Firebase.initializeApp();
  }
}
