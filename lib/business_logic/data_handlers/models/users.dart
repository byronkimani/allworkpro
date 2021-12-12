import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  Users({
    this.id,
    this.email,
    this.name,
    this.phone,
  });

  String? email;
  String? id;
  String? name;
  String? phone;

  Users.fromSnapshot(DocumentSnapshot<Object?> documentSnapshot) {
    id = documentSnapshot.id;
    email =
        (documentSnapshot.data()! as Map<String, dynamic>)['email'].toString();
    name =
        (documentSnapshot.data()! as Map<String, dynamic>)['name'].toString();
    phone =
        (documentSnapshot.data()! as Map<String, dynamic>)['phone'].toString();
  }
}
