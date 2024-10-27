import 'package:cloud_firestore/cloud_firestore.dart';

class ProviderModel {
  final String? contactName;
  final DateTime? createdAt;
  final String? email;
  final String? imageBase64;
  final String? licenseNumber;
  final String? npiNumber;
  final String? officeAddress;
  final String? password;
  final String? phoneNumber;
  final String? providerName;
  final List<dynamic>? service;
  final String? type;
  final String? id;
  final String? bio;

  ProviderModel({
    this.contactName,
    this.createdAt,
    this.email,
    this.imageBase64,
    this.licenseNumber,
    this.npiNumber,
    this.officeAddress,
    this.password,
    this.phoneNumber,
    this.providerName,
    this.service,
    this.type,
    this.id,
    this.bio,
  });

  // Factory method to create a ProviderModel from Firestore data
  factory ProviderModel.fromMap(Map<String, dynamic> data) {
    return ProviderModel(
      contactName: data['contactName'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      email: data['email'] ?? '',
      imageBase64: data['imageBase64'] ?? '',
      licenseNumber: data['licenseNumber'] ?? '',
      npiNumber: data['npiNumber'] ?? '',
      officeAddress: data['officeAddress'] ?? '',
      password: data['password'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      providerName: data['providerName'] ?? '',
      service: data['service'] is List ? data['service'] : [],
      type: data['type'] ?? '',
      id: data['id'] ?? '',
      bio: data['bio'] ?? '',
    );
  }
  ProviderModel copyWith({String? bio, List<dynamic>? service}) {
    return ProviderModel(
      contactName: contactName,
      createdAt: createdAt,
      email: email,
      imageBase64: imageBase64,
      licenseNumber: licenseNumber,
      npiNumber: npiNumber,
      officeAddress: officeAddress,
      password: password,
      phoneNumber: phoneNumber,
      providerName: providerName,
      service: service,
      type: type,
      id: id,
      bio: bio ?? this.bio,
    );
  }
}
