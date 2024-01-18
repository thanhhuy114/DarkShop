import 'package:darkshop/data/models/address.dart';

class AddressRepository {
  Future<List<Address>> getListAddress() async {
    return [
      Address(id: 1, address: "1, Nguyễn Tất Thành, Quận 4, tp Hồ Chí Minh"),
      Address(id: 1, address: "2, Nguyễn Tất Thành, Quận 4, tp Hồ Chí Minh")
    ];
  }

  Future<Address> getRecentAddress() async {
    return Address(
        id: 1, address: "1, Nguyễn Tất Thành, Quận 4, tp Hồ Chí Minh");
  }
}
