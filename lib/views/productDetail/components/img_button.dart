import 'package:darkshop/utils/constants.dart';
import 'package:darkshop/views/productDetail/productimgzoom_screen.dart';
import 'package:flutter/material.dart';

class ImgButton extends StatelessWidget {
  final Future<List<String>> urlImg;

  const ImgButton({Key? key, required this.urlImg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Điều hướng đến màn hình phóng to ảnh và truyền danh sách URL hình ảnh
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImgZoonScreen(
              urlImg: urlImg,
            ),
          ),
        );
      },
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder<List<String>>(
              future: urlImg,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Lỗi: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('Không có dữ liệu hình ảnh');
                } else {
                  // Hiển thị ảnh đầu tiên từ danh sách URL hình ảnh
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Image.network(
                      fit: BoxFit.fill,
                      Constants.pathClould + snapshot.data![0],
                      cacheHeight: 40,
                      cacheWidth: 80,
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 8),
            const Text('Xem thêm'),
          ],
        ),
      ),
    );
  }
}
