
import 'package:MJN/models/notificationModelVO.dart';
import 'package:MJN/presistence/dao/NotificationDao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'MJNDatabase.g.dart';
@Database(version: 1,entities: [NotificationModelVO])
abstract class MJNDatabase extends FloorDatabase{

  NotificationDao get notificationDao;

}