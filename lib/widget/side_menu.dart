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
            title: Text("KPOP 2020"),
            onTap: ()=>{

            },
          ),
          ListTile(
            title: Text("KPOP 2019"),
            onTap: ()=>{

            },
          ),
          ListTile(
            title: Text("KPOP 2018"),
            onTap: ()=>{

            },
          ),
        ],
      ),
    );
  }
}
