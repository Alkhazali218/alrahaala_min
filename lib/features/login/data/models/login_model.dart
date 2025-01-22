class LoginModel {
  final String number;
  final String password;
  final LoginUserModel user;
  LoginModel({required this.number, required this.password,required this.user});

  factory LoginModel.fromJson(dataJson) {
    return LoginModel(
      user: LoginUserModel.fromJson(dataJson['user']),
      number: dataJson['phone_number'] ?? '',
      password: dataJson['password'] ?? '',
    );
  }
}


class LoginUserModel {
  final String name;
  final int id;
  final String phoneNumber;

  LoginUserModel({required this.name, required this.phoneNumber,required this.id});

  factory LoginUserModel.fromJson(dataJson) {
    return LoginUserModel(
      id: dataJson['id'] ?? '',
      name: dataJson['name'] ?? '',
      phoneNumber: dataJson['phone_number'] ?? '',
    );
  }
}
