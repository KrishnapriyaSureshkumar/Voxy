import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.amber,
      centerTitle: true,
      );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}