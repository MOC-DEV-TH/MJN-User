import 'package:MJN/models/notificationModelVO.dart';
import 'package:floor/floor.dart';

@dao
abstract class NotificationDao {

  @insert
  Future<void> insertNotification(NotificationModelVO notification);

  @Query('DELETE FROM notification')
  Future<void> deleteAllNotifications();

  @Query('SELECT * FROM notification')
  Future<List<NotificationModelVO>> fetchAllNotifications();

  @update
  Future<int> updateNotification(NotificationModelVO notification);
}