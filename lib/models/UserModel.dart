class UserList {
  static List<UserModel> user = [];
}

class UserModel {
  final String username;
  final String phone;
  final String name;
  final String imageUrl;
  final String rechargeBalance;
  final String driveBalance;
  final String pin;

  UserModel({
    required this.username,
    required this.phone,
    required this.name,
    required this.imageUrl,
    required this.rechargeBalance,
    required this.driveBalance,
    required this.pin,
  });
}
