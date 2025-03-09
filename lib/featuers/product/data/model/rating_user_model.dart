class RatingUserModel {
  String id;
  String name;
  String image;
  num rating;

  RatingUserModel({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
  });

  factory RatingUserModel.fromJson(Map<String, dynamic> json) {
    return RatingUserModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      rating: json['rating'],
    );
  }
  toJson() {
    return {'id': id, 'name': name, 'image': image, 'rating': rating};
  }
}
