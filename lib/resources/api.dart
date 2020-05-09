import 'package:cloud_firestore/cloud_firestore.dart';

class Api {
  Future<void> saveRegistration(
      {uid,
      email,
      password,
      firstName,
      lastName,
      dateOfBirth,
      gender,
      streetAddress,
      city,
      states,
      pin}) async {
    await Firestore.instance
        .collection('users')
        .document(uid)
        .setData({
          'first_name': firstName,
          'last_name': lastName,
          'date_of_birth': dateOfBirth,
          'gender': gender,
          'street_address': streetAddress,
          'city': city,
          'state': states,
          'pin': pin
        })
        .then((result) => print('here'))
        .catchError((err) => print(err));
  }
}
