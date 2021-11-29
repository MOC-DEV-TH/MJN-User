import 'package:floor/floor.dart';

@Entity(tableName: 'notification')
class NotificationModelVO {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String title;
  final String body;
  final String message;
  final String type_name;
  final String action_url;
  final String created;

  NotificationModelVO(this.id, this.title, this.body, this.message, this.type_name, this.action_url, this.created);

  NotificationModelVO.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        body = json['body'],
        message = json['message'],
        type_name = json['type_name'],
        action_url = json['action_url'],
        created = json['created'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'body': body,
    'message': message,
    'type_name': type_name,
    'action_url': action_url,
    'created': created
  };

  @override
  String toString() {
    return 'Dog{id: $id, title: $title, body: $body, message: $message, type_name: $type_name, action_url: $action_url}';
  }

}
