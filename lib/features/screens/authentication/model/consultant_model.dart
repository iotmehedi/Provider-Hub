import 'package:cloud_firestore/cloud_firestore.dart';

class ConsultantModel {
  final String? fullName;
  final String? phoneNumber;
  final String? email;
  final String? consults;
  final String? imageBase64;
  final List<dynamic>? service;
  final String? password;
  final String? type;
  final DateTime? createdAt;
  final String? id;
  final String? bio;

  ConsultantModel({
    this.fullName,
    this.phoneNumber,
    this.email,
    this.consults,
    this.imageBase64,
    this.service,
    this.password,
    this.type,
    this.createdAt,
    this.id,
    this.bio,
  });

  factory ConsultantModel.fromJson(Map<String, dynamic> json) {
    return ConsultantModel(
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      consults: json['consults'],
      imageBase64: json['imageBase64'],
      service: json['service'] is List ? json['service'] : [],
      password: json['password'],
      type: json['type'],
      id: json['id'],
      bio: json['bio'],
      createdAt: json['createdAt'] != null
          ? (json['createdAt'] as Timestamp).toDate()
          : null, // Handle null timestamp
    );
  }

  // Method to convert a ConsultantModel object to JSON
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'consults': consults,
      'imageBase64': imageBase64,
      'service': service,
      'password': password,
      'type': type,
      'id': id,
      'bio': bio,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : FieldValue.serverTimestamp(),
    };
  }
  // Method to create a copy with updated fields
  ConsultantModel copyWith({
    String? fullName,
    String? phoneNumber,
    String? email,
    String? consults,
    String? imageBase64,
    List<dynamic>? service,
    String? password,
    String? type,
    DateTime? createdAt,
    String? id,
    String? bio,
  }) {
    return ConsultantModel(
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      consults: consults ?? this.consults,
      imageBase64: imageBase64 ?? this.imageBase64,
      service: service ?? this.service,
      password: password ?? this.password,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      bio: bio ?? this.bio,
    );
  }
}
