import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Center(child: Text("KPOP TUBE", style: TextStyle(color: Colors.white, fontSize: 26),)),
            decoration: BoxDecoration(color: Colors.red),
          ),
          ListTile(
            title: Text("dd 1"),
            onTap: ()=>{

            },
          )
        ],
      ),
    );
  }
}
