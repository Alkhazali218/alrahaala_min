class RegisterModel {
  final String number;
  final String password;
  final String deviceId;

  RegisterModel(
      {required this.number, required this.password, required this.deviceId});

  factory RegisterModel.fromJson(dataJson) {
    return RegisterModel(
      number: dataJson['phone'] ?? '',
      password: dataJson['password'] ?? '',
      deviceId: dataJson['device_id'] ?? '',
    );
  }
}
