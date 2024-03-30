class UserModel {
  final String? id;
  final String displayName;
  final String email;
  final String phoneNumber;
  final String? photoUrl;

  const UserModel({
    this.id,
    required this.displayName,
    required this.email,
    required this.phoneNumber,
    this.photoUrl,
  });

  toJSON() {
    return {
      "displayName": displayName,
      "email": email,
      "phoneNumber": phoneNumber,
    };
  }
}
