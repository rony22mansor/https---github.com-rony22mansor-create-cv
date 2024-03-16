// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

class Cv {
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String description;
  Uint8List photoPath;

  Cv({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.description,
    required this.photoPath,
  });
}
