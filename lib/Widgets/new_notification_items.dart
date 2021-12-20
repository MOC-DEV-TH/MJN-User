import 'package:MJN/models/notificationModelVO.dart';
import 'package:MJN/presistence/dao/NotificationDao.dart';
import 'package:MJN/presistence/database/MyAppDatabase.dart';
import 'package:MJN/utils/eventbus_util.dart';
import 'package:flutter/material.dart';

class NewNotificationItems extends StatefulWidget {
  String text;
  NotificationModelVO notificationList;


  NewNotificationItems(this.text, this.notificationList);
  @override
  _NewNotificationItemsState createState() => _NewNotificationItemsState();
}

class _NewNotificationItemsState extends State<NewNotificationItems> {
  bool isReadMore = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(12),
      color: Colors.white,
      child: Column(
        children: [
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(image: AssetImage('assets/images/outage_icon.png')),

          Container(height: 40, width: 2, color: Colors.grey,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('13 Oct 2021',
              style: TextStyle(fontSize: 8, color: Colors.grey,),textAlign: TextAlign.left,),

            InkWell(
                onTap: () {
                  setState(() {
                    isReadMore = true;
                  });
                  NotificationModelVO notification = new NotificationModelVO(widget.notificationList.id,
                      widget.notificationList.title,
                      widget.notificationList.body,
                      widget.notificationList.message,
                      widget.notificationList.type_name, widget.notificationList.action_url, widget.notificationList.created,read: 1);


                  //widget.notificationDao.updateNotification(notification);
                  //MyAppDatabase.notificationDao!.updateNotification(notification);

                },
                child: Text('Outage on 20 Oct 2021...',
                  style: TextStyle(fontSize: 14, color: Colors.black),)),

          ],),

       // widget.notificationList.read == 1 ? Container() :  Icon(Icons.circle,color: Color(0xff659EC7),size: 5,)
        ],),

      isReadMore ? Padding(
        padding: const EdgeInsets.all(8.0),
        child:  Text(widget.text,
            style: TextStyle(fontSize: 14, color: Colors.black),),
      )
          : Container(),


        isReadMore ?  Container(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: (){
                setState(() {
                  isReadMore = !isReadMore;
                });
              },
              child: Text('show less',
                style: TextStyle(fontSize: 10, color: Color(0xff188FC5),),textAlign: TextAlign.end,),
            ),
          ) : Container(),

      ],
    ),);

  }
}
