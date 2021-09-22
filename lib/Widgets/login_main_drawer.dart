import 'package:flutter/material.dart';

class LoginMainDrawer extends StatelessWidget {

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
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 145,
            width: double.infinity,
            padding: EdgeInsets.all(15),
            color: Theme.of(context).primaryColorDark,
            alignment: Alignment.centerLeft,
            child: Text(
              'Login Drawer',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          buildListTile('Products and Services', Icons.arrow_right,
                  (){
            // Navigator.of(context).pushReplacementNamed('/');
          }),

          buildListTile('About us', Icons.arrow_right,
                  (){
          }),
          buildListTile('Terms & Conditions', Icons.arrow_right,
                  (){
                // Navigator.of(context).pushReplacementNamed('/');
              }),

          buildListTile('Contact us', Icons.arrow_right,
                  (){
              }),


        ],
      ),
    );
  }
}
