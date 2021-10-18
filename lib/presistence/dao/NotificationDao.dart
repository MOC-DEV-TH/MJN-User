import 'package:MJN/models/notificationModelVO.dart';
import 'package:floor/floor.dart';

@dao
abstract class NotificationDao {
  @Query('SELECT * FROM notification')
  Future<List<NotificationModelVO>> getAllNotifications();

  @insert
  Future<void> insertNotification(NotificationModelVO notificationModelVO);
  
}