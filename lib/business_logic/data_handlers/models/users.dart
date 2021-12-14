import 'package:firebase_database/firebase_database.dart';

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

  Users.fromSnapshot(DataSnapshot dataSnapshot) {
    Users(
      id: dataSnapshot.key,
      email: (dataSnapshot.value as Map<String, dynamic>?)!['email'] as String,
      name: (dataSnapshot.value as Map<String, dynamic>?)!['name'] as String,
      phone: (dataSnapshot.value as Map<String, dynamic>?)!['phone'] as String,
    );
  }
}
