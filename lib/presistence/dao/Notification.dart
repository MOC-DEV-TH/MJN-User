
import 'package:floor/floor.dart';

@entity
class Notification {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String title;
  final String body;
  final String message;

  Notification(this.id, this.title, this.body, this.message,
      );
}
