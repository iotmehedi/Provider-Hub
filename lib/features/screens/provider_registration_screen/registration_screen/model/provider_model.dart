class ProviderModel {
  String uid;
  String email;
  String name;
  String services;
  String contactName;
  String contactNumber;
  String officeAddress;
  String licenseNumber;
  String npiNumber;
  String? imageUrl;
  String password;

  ProviderModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.services,
    required this.contactName,
    required this.contactNumber,
    required this.officeAddress,
    required this.licenseNumber,
    required this.npiNumber,
    this.imageUrl,
    required this.password,
  });

  // Convert a ProviderModel object into a Map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'password': password,
      'name': name,
      'services': services,
      'contactName': contactName,
      'contactNumber': contactNumber,
      'officeAddress': officeAddress,
      'licenseNumber': licenseNumber,
      'npiNumber': npiNumber,
      'imageUrl': imageUrl, // Include image URL
    };
  }

  // Create a ProviderModel from a Map
  factory ProviderModel.fromMap(Map<String, dynamic> map) {
    return ProviderModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      name: map['name'] ?? '',
      services: map['services'] ?? '',
      contactName: map['contactName'] ?? '',
      contactNumber: map['contactNumber'] ?? '',
      officeAddress: map['officeAddress'] ?? '',
      licenseNumber: map['licenseNumber'] ?? '',
      npiNumber: map['npiNumber'] ?? '',
      imageUrl: map['imageUrl'], // Assign image URL
    );
  }
}
