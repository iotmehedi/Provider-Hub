class LicenseSpecialist {
  final String? name;
  final String? position;
  final String? phoneNumber;
  final String? email;

  LicenseSpecialist({
    this.name,
    this.position,
    this.phoneNumber,
    this.email,
  });

  // Convert a LicenseSpecialist into a Map.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'position': position,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }

  // Extract a LicenseSpecialist object from a Map.
  factory LicenseSpecialist.fromMap(Map<String, dynamic> map) {
    return LicenseSpecialist(
      name: map['name'] ?? '',
      position: map['position'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      email: map['email'] ?? '',
    );
  }
}
