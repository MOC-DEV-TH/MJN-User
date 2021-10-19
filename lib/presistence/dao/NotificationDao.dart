import 'package:MJN/models/notificationModelVO.dart';
import 'package:floor/floor.dart';

@dao
abstract class NotificationDao {

  @insert
  Future<void> insertNotification(NotificationModelVO notificationModelVO);

  @delete
  Future<void> deleteNote(NotificationModelVO notificationModelVO);

}