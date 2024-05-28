import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetails(Map<String, dynamic> userInfoMap) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc()
        .set(userInfoMap);
  }

  Future<QuerySnapshot> gettingUserInfo(String name) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("FirstName", isEqualTo: name)
        .get();
  }

  Future UpdateUserData(String age, String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .update({"Age": age});
  }
}
