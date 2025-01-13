class NotificationModel {
  final MessageModel message;

  NotificationModel({required this.message});

  factory NotificationModel.fromJson(jsonData) {
    return NotificationModel(
      message: MessageModel.fromJson(jsonData['message']),
    );
  }
}

class MessageModel {
  final String topic;
  final NotificationBodyModel notification;

  MessageModel({required this.topic, required this.notification});

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(
      topic: jsonData['topic'],
      notification: NotificationBodyModel.fromJson(jsonData['notification']),
    );
  }
}

class NotificationBodyModel {
  final String body;
  final String title;

  NotificationBodyModel({required this.body, required this.title});

  factory NotificationBodyModel.fromJson(jsonData) {
    return NotificationBodyModel(
      body: jsonData['body'],
      title: jsonData['title'],
    );
  }
}
