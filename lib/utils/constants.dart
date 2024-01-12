enum NotificationType {
  orderSuccessful,
  newOrder,
  paymentSuccessful,
  deliverySuccessful,
  orderCancelled,
  outOfStock,
}

class Constants {
  static const Map<NotificationType, String> notificationTypes = {
    NotificationType.orderSuccessful: "Đặt hàng thành công",
    NotificationType.newOrder: "Đơn hàng mới",
    NotificationType.paymentSuccessful: "Thanh toán thành công",
    NotificationType.deliverySuccessful: "Giao hàng thành công",
    NotificationType.orderCancelled: "Đơn hàng đã hủy",
    NotificationType.outOfStock: "Sắp hết hàng",
  };

  static const String avatarDefault = "assets/image_user/avt_default.png";
  static const String account = "Tài khoản";
  static const String notification = "Thông báo";
  static const String fullname = "Họ và tên";
  static const String email = "Email";
  static const String phone = "Số điện thoại";
  static const String address = "Địa chỉ";
  static const String changePassword = "Đổi mật khẩu";
  static const String logout = "Đăng xuất";

  static const String related = "Liên quan";
  static const String latest = "Mới nhất";
  static const String price = "Giá";
  static const String search = "Tìm kiếm";

  static const int indexRelatedProducts = 0;
  static const int indexLatestProducts = 1;
  static const int indexPriceIncreaseProducts = 2;
  static const int indexPriceDecreaseProducts = 3;
}
