class DeletListModel {
  final String id;

  DeletListModel({required this.id});
  factory DeletListModel.fromJson(dataJson) {
    return DeletListModel(
      id: dataJson['id'] ?? '',
    );
  }
}