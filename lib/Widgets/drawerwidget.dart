import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                accountName: Text("Bui Tat Hung",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                accountEmail: Text("buitathung2012002@gmail.com"),
                currentAccountPicture: CircleAvatar(backgroundImage: AssetImage("images/avatar.jpg")),
              )
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.home,color: Colors.red,),
            title: const Text("Home",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            onTap: () {
              Navigator.pushNamed(context, "/");
            },
          ),
          listTile(CupertinoIcons.person, "My Account"),
          listTile(CupertinoIcons.cart_fill, "My Order"),
          listTile(CupertinoIcons.heart_fill, "My Wish List"),
          listTile(CupertinoIcons.settings, "Settings"),
          listTile(Icons.exit_to_app, "Log Out"),
        ],
      ),
    );
  }
}

ListTile listTile(IconData iconData,String name){
  return ListTile(
    leading: Icon(iconData,color: Colors.red,),
    title: Text(name,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
  );
}