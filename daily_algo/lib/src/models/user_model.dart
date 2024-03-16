class UserModel {
  final String? id;
  final String displayName;
  final String email;
  final String phoneNumber;
  final String password;
  // final String? photoUrl;

  const UserModel({
    this.id,
    required this.displayName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    // this.photoUrl,
  });

  toJSON() {
    return {
      "DisplayName": displayName,
      "Email": email,
      "Phone" : phoneNumber,
      "Password": password,
    };
  }
}
