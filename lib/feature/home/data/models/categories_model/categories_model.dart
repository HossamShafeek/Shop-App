class CategoryModel {
 final String name;
 final String imageUrl;


 const CategoryModel({required this.name, required this.imageUrl});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
      imageUrl: json['image_url'],
    );
  }
}
