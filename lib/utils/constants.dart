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
}
