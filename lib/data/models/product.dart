class Product{
  int idType;
  String image;
  String imageInfo;
  String name;
  String description;
  int price;
  int promotion;
  int repository;
  DateTime postAt;

  Product({
    required this.idType,
    required this.image,
    required this.imageInfo,
    required this.name,
    required this.description,
    required this.price,
    required this.promotion,
    required this.repository,
    required this.postAt,
  });

  Product.empty()
      : idType = 0,
        image = '',
        imageInfo = '',
        name = '',
        description = '',
        price = 0,
        promotion = 0,
        repository = 0,
        postAt = DateTime.now();
}