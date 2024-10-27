import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? officeAddress;
  final List<dynamic>? training;
  final String? type;
  final String? imageBase64;
  final String? password;
  final DateTime? createdAt;
  final String? id;
  final String? bio;

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
    this.id,
    this.bio,
  });

  // Factory method to create a UserModel from Firestore data
  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      fullName: data['fullName'] ?? '',
      email: data['email'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      officeAddress: data['officeAddress'] ?? '',
      training: data['training'] is List ? data['training'] : [],
      type: data['type'] ?? '',
      imageBase64: data['imageBase64'] ?? '',
      password: data['password'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      id: data['id'] ?? '',
      bio: data['bio'] ?? '',
    );
  }
  UserModel copyWith({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? officeAddress,
    List<dynamic>? training,
    String? type,
    String? imageBase64,
    String? password,
    DateTime? createdAt,
    String? id,
    String? bio,
  }) {
    return UserModel(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      officeAddress: officeAddress ?? this.officeAddress,
      training: training ?? this.training,
      type: type ?? this.type,
      imageBase64: imageBase64 ?? this.imageBase64,
      password: password ?? this.password,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      bio: bio ?? this.bio,
    );
  }
}
