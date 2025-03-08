class OtpModel {
  final String phone;
  final String message;
  final String xToken;

  OtpModel({required this.phone, required this.message, required this.xToken});

  factory OtpModel.fromJson(dataJson) {
    return OtpModel(
      phone: dataJson['phone'] ?? '',
      message: dataJson['message'] ?? '',
      xToken: dataJson['xtoken'] ?? '',
    );
  }
}
