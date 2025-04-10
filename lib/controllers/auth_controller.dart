import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/firebase_consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // Login method
  Future<UserCredential?> loginMethod({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.message ?? e.toString());
    }
    return userCredential;
  }

  // Signup method
  Future<UserCredential?> signupMethod({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.message ?? e.toString());
    }
    return userCredential;
  }

  // Storing user data (avoid saving password!)
  Future<void> storeUserData({
    required String name,
    required String email,
    required String password,
  }) async {
    if (auth.currentUser != null) {
      DocumentReference store =
          firestore.collection(usersCollection).doc(auth.currentUser!.uid);
      await store.set({
        'name': name,
        'email': email,
        'imageUrl': '',
        'uid': auth.currentUser!.uid,
        'createdAt': FieldValue.serverTimestamp(),
      });
    }
  }

  // Sign out method
  Future<void> signoutMethod(BuildContext context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
