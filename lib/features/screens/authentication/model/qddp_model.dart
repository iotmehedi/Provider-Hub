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
  final String? bio;

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
    this.bio,
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
      bio: json['bio'],
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
      'bio': bio,
      'createdAt': createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : FieldValue.serverTimestamp(),
    };
  }
  // Method to create a copy with updated fields
  QDDPModel copyWith({
    String? fullName,
    String? phoneNumber,
    String? email,
    String? consults,
    String? type,
    List<dynamic>? service,
    String? imageBase64,
    String? password,
    String? degreeField,
    String? degree,
    DateTime? createdAt,
    String? id,
    String? bio,
  }) {
    return QDDPModel(
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      consults: consults ?? this.consults,
      type: type ?? this.type,
      service: service ?? this.service,
      imageBase64: imageBase64 ?? this.imageBase64,
      password: password ?? this.password,
      degreeField: degreeField ?? this.degreeField,
      degree: degree ?? this.degree,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      bio: bio ?? this.bio,
    );
  }
}
