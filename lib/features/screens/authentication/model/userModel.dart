import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? officeAddress;
  final String? training;
  final String? type;
  final String? imageBase64;
  final String? password;
  final DateTime? createdAt;

  UserModel({
    this.fullName,
    this.email,
    this.phoneNumber,
    this.officeAddress,
    this.training,
    this.type,
    this.imageBase64,
    this.password,
    this.createdAt,
  });

  // Factory method to create a UserModel from Firestore data
  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      fullName: data['fullName'] ?? '',
      email: data['email'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      officeAddress: data['officeAddress'] ?? '',
      training: data['training'] ?? '',
      type: data['type'] ?? '',
      imageBase64: data['imageBase64'] ?? '',
      password: data['password'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }
}
