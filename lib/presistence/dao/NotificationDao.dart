import 'package:MJN/models/notificationModelVO.dart';
import 'package:floor/floor.dart';

@dao
abstract class NotificationDao {

  @insert
  Future<void> insertNotification(NotificationModelVO notification);

  @delete
  Future<void> deleteNote(NotificationModelVO notification);

  @Query('SELECT * FROM notification')
  Future<List<NotificationModelVO>> findAllNoti();

  @update
  Future<int> updateNotification(NotificationModelVO notification);
}