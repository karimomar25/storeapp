class ProductModel {
  int id;
  var title;
  var price;
  String desc;
  String category;
  String image;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.image,
    required this.desc,
  });

  factory ProductModel.fromJson({jsonData}) {
    return ProductModel(
        id: jsonData["id"],
        title: jsonData["title"],
        price: jsonData["price"],
        category: jsonData["category"],
        image: jsonData["image"],
        desc: jsonData["description"]);
  }
}
