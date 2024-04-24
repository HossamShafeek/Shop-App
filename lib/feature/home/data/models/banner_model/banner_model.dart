class BannerModel {
  final String imageUrl;

  const BannerModel({required this.imageUrl});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      imageUrl: json['image_url'],
    );
  }
}
