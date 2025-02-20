class PasswordModel {
  final String phone;
  final String passwiord;
  final String deviceId;

  PasswordModel({required this.phone, required this.passwiord,required this.deviceId});

  factory PasswordModel.fromJson(dataJson) {
    return PasswordModel(
      phone: dataJson['phone'] ?? '',
      passwiord: dataJson['password'] ?? '',
      deviceId: dataJson['device_id'] ?? '',
    );
  }
}
