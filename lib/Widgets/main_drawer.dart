import 'package:MJN/views/ChangePasswordView.dart';
import 'package:MJN/views/NewLoginView.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title,IconData icon,Function tabsHandler){
    return
      ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(title,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.normal),),
        onTap: tabsHandler,
      );
  }

  @override
  Widget build(BuildContext context) {
    return
      Drawer(
        child: Column(
          children: [
            Container(
              height: 145,
              width: double.infinity,
              padding: EdgeInsets.all(15),
              color: Color(0xFFEEEEEE),
              alignment: Alignment.centerLeft,
              child: Text(
                'Main Drawer',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildListTile('Change Password', Icons.arrow_right,
                    (){
                      Navigator.of(context).pushNamed(ChangePasswordView.routeName);
            }),

            buildListTile('About us', Icons.arrow_right,
                    (){
            }),
            buildListTile('Terms & Conditions', Icons.arrow_right,
                    (){
                  // Navigator.of(context).pushReplacementNamed('/');
                }),

            buildListTile('Logout', Icons.arrow_right,
                    (){
                      Navigator.of(context).pushNamed(NewLoginView.routeName);

                }),

          ],
        ),
      );
  }
}
