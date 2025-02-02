class RegisterModel {
  final String userName;
  final String number;
  final String password;
  final String passwordConfirmation;

  RegisterModel({required this.userName, required this.number, required this.password, required this.passwordConfirmation});

  factory RegisterModel.fromJson(dataJson) {
    return RegisterModel(
      userName: dataJson['name'] ?? '',
       number: dataJson['phone_number'] ?? '',
        password: dataJson['password'] ?? '',
         passwordConfirmation: dataJson['password_confirmation'] ?? '',
         );
  }
}