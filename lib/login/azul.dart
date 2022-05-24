// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

class Azul {
  static const String appName = 'Cualli';

  static SharedPreferences? sharedPreferences;
  static User? user;
  static FirebaseAuth? auth;
  static FirebaseFirestore? firestore;

  static String collectionUser = "users";
  static String collectionOrders = "orders";
  static String subCollectionAddress = 'userAddress';

  static final String userName = 'name';
  static final String userEmail = 'email';
  static const String userUID = 'uid';
  static const String userAvatarUrl = 'url';

  static final String addressID = 'addressID';
  static final String isSuccess = 'isSuccess';
}
