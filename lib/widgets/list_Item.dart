import 'package:flutter/material.dart';
class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.picture,
    required this.title,
    required this.index,
    required this.delItem,
  });

  final String? picture;
  final String? title;
  final int index;
  final Function(int) delItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset('assets/images/logo_$picture.png'),
        title: Text('Name : $title'),
        trailing: const Icon(Icons.delete),
        onTap: ()=> print("on tape"),
        onLongPress: ()=> delItem(index),
      ),
    );
  }
}