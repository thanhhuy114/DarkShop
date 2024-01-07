import 'package:darkshop/views/product/components/product_info.dart';
import 'package:flutter/material.dart';

class productInfoScreen extends StatefulWidget {
  const productInfoScreen({super.key});

  @override
  State<productInfoScreen> createState() => _productInfoScreenState();
}

class _productInfoScreenState extends State<productInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ss'),
      ),
      body: SingleChildScrollView(
          child: Container(
        color: const Color.fromARGB(255, 255, 185, 88),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.network(
                'https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/4/20/637860593091364580_HASP-ASUS-FX506H-9.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const productInfo(
              textInfo: '''
              Thông tin hàng hóa
              P/N: FX506HF-HN017W
              Thương hiệu: Asus
              Xuất xứ: Trung Quốc
              Thời điểm ra mắt: 4/2023
              Thời gian bảo hành (tháng): 24
              Hướng dẫn bảo quản: Để nơi khô ráo, nhẹ tay, dễ vỡ.
              Hướng dẫn sử dụng: Xem trong sách hướng dẫn sử dụng

              Thiết kế & Trọng lượng
              Kích thước 359 x 256 x 22.8 ~ 24.3 mm
              Trọng lượng sản phẩm 2.3 kg
              Màu sắc Đen
              Chất liệu Nhôm + Nhựa cao cấp

              Bộ xử lý
              Hãng CPU Intel
              Công nghệ CPU Core i5
              Loại CPU 11400H
              Tốc độ CPU 2.7 GHz
              Tốc độ tối đa 4.5 GHz
              Số nhân 6

              RAM
              Dung lượng RAM 16 GB (2 thanh 8 GB)
              Loại RAM DDR4
              Tốc độ RAM 3200 MHz
              Số khe cắm rời 2
              Số khe RAM còn lại Không
              Số RAM onboard 0
              Hỗ trợ RAM tối đa 32 GB

              Màn hình
              Kích thước màn hình 15.6 inch
              Công nghệ màn hình Anti-Glare
              Độ phân giải 1920 x 1080 Pixels
              Tần số quét 144 Hz
              Tấm nền IPS

              Đồ họa
              Card rời
              Hãng NVIDIA
              Model Geforce RTX 2050
              Bộ nhớ 4 GB

              Lưu trữ
              Kiểu ổ cứng SSD
              Loại SSD M2. PCIe
              Dung lượng 512 GB

              Bảo mật
              Mật khẩu

              Giao tiếp & kết nối
              Cổng giao tiếp
              1 HDMI 2.1
              1 Jack 3.5 mm
              1 LAN
              1 Thunderbolt
              3 USB 3.2

              Wifi
              Dual-band (2.4 GHz/ 5 GHz)
              Wifi 6
              Bluetooth v5.2

              Webcam
              HD Webcam (720p Webcam)

              Bàn phím & TouchPad
              Kiểu bàn phím Backlit Chiclet Keyboard
              Bàn phím số Có
              Đèn bàn phím LED
              Công nghệ đèn bàn phím RGB 1 Zone
              TouchPad Multi-touch touchpad

              Thông tin pin & Sạc
              Dung lượng pin 3 Cell
              Power Supply 48 W

              Hệ điều hành
              OS Windows
              Version Windows 11 Home 
                          ''',
            ),
          ],
        ),
      )),
    );
  }
}
