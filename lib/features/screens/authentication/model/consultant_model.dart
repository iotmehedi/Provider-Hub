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
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : FieldValue.serverTimestamp(),
    };
  }
}
