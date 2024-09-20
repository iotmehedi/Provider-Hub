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
  final String? service;
  final String? type;
  final String? id;

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
      service: data['service'] ?? '',
      type: data['type'] ?? '',
      id: data['id'] ?? '',
    );
  }
}
