class User{
  bool isAdmin;
  String fullname;
  String image;
  String phone;
  String email;
  String recentAddress;
  bool blocked;

  User({
    required this.isAdmin,
    required this.fullname,
    required this.image,
    required this.phone,
    required this.email,
    required this.recentAddress,
    required this.blocked,
  });

  User.empty()
      : isAdmin = false,
        fullname = '',
        image = '',
        phone = '',
        email = '',
        recentAddress = '',
        blocked = false;
}