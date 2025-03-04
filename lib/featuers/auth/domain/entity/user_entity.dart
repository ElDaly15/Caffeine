// ignore_for_file: file_names

class UserEntity {
  final String email;
  final String name;
  final String image;
  final String uid;
  final List<dynamic> notificationToken;

  UserEntity(
      {required this.email,
      required this.name,
      required this.uid,
      required this.notificationToken,
      required this.image});

  toMap() {
    return {
      "email": email,
      "name": name,
      "notificationToken": notificationToken,
      "uid": uid,
      'image': image,
    };
  }
}
