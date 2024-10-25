import 'package:cloud_firestore/cloud_firestore.dart';

class QDDPModel {
  final String? fullName;
  final String? phoneNumber;
  final String? email;
  final String? consults;
  final String? type;
  final List<dynamic>? service;
  final String? imageBase64;
  final String? degreeField;
  final String? degree;
  final String? password;
  final DateTime? createdAt;
  final String? id;

  QDDPModel({
    this.fullName,
    this.phoneNumber,
    this.email,
    this.consults,
    this.type,
    this.service,
    this.imageBase64,
    this.password,
    this.degreeField,
    this.degree,
    this.createdAt,
    this.id,
  });

  // Factory method to create a QDDPModel object from JSON
  factory QDDPModel.fromJson(Map<String, dynamic> json) {
    return QDDPModel(
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      consults: json['consults'],
      type: json['type'],
      service: json['service'] is List ? json['service'] : [],
      imageBase64: json['imageBase64'],
      degreeField: json['degreeField'],
      degree: json['degree'],
      password: json['password'],
      id: json['id'],
      createdAt: json['createdAt'] != null
          ? (json['createdAt'] as Timestamp).toDate()
          : null, // Handle null timestamp
    );
  }

  // Method to convert a QDDPModel object to JSON
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'consults': consults,
      'type': type,
      'service': service,
      'imageBase64': imageBase64,
      'degreeField': degreeField,
      'degree': degree,
      'password': password,
      'id': id,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : FieldValue.serverTimestamp(),
    };
  }
}
