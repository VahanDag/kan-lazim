import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kan_lazim/models/user_model.dart';

class FirebaseService {
  Future<bool> createUser({required UserModel model, required String password}) async {
    try {
      final createUser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(email: model.email ?? "", password: password);

      if (createUser.user != null) {
        await FirebaseFirestore.instance.collection("users").doc(createUser.user!.uid).set(model.toMap());
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({required String email, required String password}) async {
    try {
      final signIn = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      if (signIn.user != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  bool userControll() {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<UserModel> getUser() async {
    final documentSnapshot =
        await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser?.uid).get();

    final user = documentSnapshot.data();

    return UserModel.fromMap(user ?? {});
  }
}
