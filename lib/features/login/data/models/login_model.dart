class LoginModel {
  final String number;
  final String password;

  LoginModel({required this.number, required this.password});

  factory LoginModel.fromJson(dataJson) {
    return LoginModel(
      number: dataJson['phone_number'] ?? '',
      password: dataJson['password'] ?? '',
    );
  }
}
