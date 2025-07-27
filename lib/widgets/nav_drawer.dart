import 'package:flutter/material.dart';
import '../screens/note.dart';
import '../screens/reader.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(color: Colors.amberAccent),
            child: Center(
              child: Text(
              "Menu",
              style: TextStyle(
                fontSize: 32.0,
                color: Colors.black87),
                )
            )
          ),
          ListTile(
            leading: Icon(Icons.chrome_reader_mode_outlined),
            title: Text("Accessibility Reader"),
            onTap:() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Reader();
                })
              );
            },
            ),
            ListTile(
            leading: Icon(Icons.audio_file_outlined),
            title: Text("Voice Notes"),
            onTap:() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Note();
                })
              );
            },
            )
        ],
      )
    );
  }
}