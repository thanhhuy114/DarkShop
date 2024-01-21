import 'package:darkshop/data/models/product_type.dart';

class ProductTypeRepository {
  static Future<List<ProductTypeModel>> getAllProductType() async {
    return [
      ProductTypeModel(
          id: 0,
          name: 'Tai nghe',
          pathImage: 'assets/home_screen/type_product/sound.png'),
      ProductTypeModel(
          id: 1,
          name: 'laptop',
          pathImage: 'assets/home_screen/type_product/laptop.png'),
      ProductTypeModel(
          id: 2,
          name: 'Điện thoại',
          pathImage: 'assets/home_screen/type_product/phone.png'),
      ProductTypeModel(
          id: 3,
          name: 'Camera',
          pathImage: 'assets/home_screen/type_product/camera.png'),
      ProductTypeModel(
          id: 4,
          name: 'Ghế gaming',
          pathImage: 'assets/home_screen/type_product/chair.png'),
      ProductTypeModel(
          id: 5,
          name: 'Gaming gear',
          pathImage: 'assets/home_screen/type_product/gaming_gear.png'),
      ProductTypeModel(
          id: 6,
          name: 'Bàn phím, chuột',
          pathImage: 'assets/home_screen/type_product/keyandmouse.png'),
      ProductTypeModel(
          id: 7,
          name: 'Robot hút bụi',
          pathImage: 'assets/home_screen/type_product/robot_clean.png'),
      ProductTypeModel(
          id: 8,
          name: 'Máy chiếu',
          pathImage: 'assets/home_screen/type_product/projecter.png'),
      ProductTypeModel(
          id: 9,
          name: 'Đồng hồ',
          pathImage: 'assets/home_screen/type_product/watch.png')
    ];
  }
}
