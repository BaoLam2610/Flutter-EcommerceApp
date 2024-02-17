enum UserType {
  user,
  admin,
  seller,
}

extension UserTypeExtension on UserType {
  String get key {
    switch (this) {
      case UserType.user:
        return 'user';
      case UserType.admin:
        return 'admin';
      case UserType.seller:
        return 'seller';
      default:
        return 'user';
    }
  }
}

extension UserTypeStringExtension on String? {
  UserType get userType {
    switch (this) {
      case 'user':
        return UserType.user;
      case 'admin':
        return UserType.admin;
      case 'seller':
        return UserType.seller;
      default:
        return UserType.user;
    }
  }
}
