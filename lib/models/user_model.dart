class UserModel {
  final String id;
  final String name;
  final String email;
  final String profilePictureUrl;
  final String bio; 

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePictureUrl,
    this.bio = '', 
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      profilePictureUrl: json['profilePictureUrl'] ?? '',
      bio: json['bio'] ?? '', 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
      'bio': bio, 
    };
  }
}
