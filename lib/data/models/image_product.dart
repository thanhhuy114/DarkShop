import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

var url = '''https://res.cloudinary.com/dvrzyngox/image/upload/v1705543245/''';

class ImageProduct {
  int id;
  Uint8List? image;
  int id_product;

  ImageProduct(
      {required this.id, required this.image, required this.id_product});

  ImageProduct.empty() //khởi tạo giá trị mặc định cho ImageProduct
      : id = 0,
        image = null,
        id_product = 0;

  factory ImageProduct.fromJson(Map<String, dynamic> json) {
    Uint8List? decodeImage(dynamic image) {
      if (image is String) {
        // Nếu 'image' là một chuỗi, giả sử rằng đó là dữ liệu ảnh đã được mã hóa
        return Uint8List.fromList(base64.decode(image));
      } else if (image is List<dynamic>) {
        // Nếu 'image' là một danh sách, xử lý nó theo logic của bạn
        // Ví dụ: Kết hợp tất cả các phần tử trong danh sách để tạo một chuỗi và sau đó giải mã
        String combinedString = image.join();
        return Uint8List.fromList(base64.decode(combinedString));
      }
      return null;
    }

    return ImageProduct(
      id: json['id'],
      image: decodeImage(json['image']),
      id_product: json['id_product'],
    );
  }

  Future<Uint8List> imageFileToUint8List(String imagePath) async {
    // Đọc nội dung của tệp hình ảnh thành Uint8List
    File imageFile = File(imagePath);
    List<int> imageBytes = await imageFile.readAsBytes();

    // Chuyển đổi List<int> thành Uint8List
    Uint8List uint8List = Uint8List.fromList(imageBytes);

    return uint8List;
  }
}
