import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:renaudtest/pages/form_page.dart';
import 'package:renaudtest/services/liste_service.dart';

import '../widgets/list_Item.dart';


class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final items = itemsList;
  deleteItem(int idx){
    setState(() {
      print('delete $idx');
      itemsList.removeAt(idx);
    });
  }
  addingItem(Map<String, String> data){
    setState(() {
      print('adding $data');
      itemsList.add(data);
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length+1 ,
      itemBuilder: (context,index){
        if (index==items.length){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                    backgroundColor: Colors.amber,
              ),
                onPressed: () => Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (_,__,___)=>FormPage(addItem: addingItem),
                )),
                child: const Text("Add New Item",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                )
            ),
          );
        }
        final item=items[index];
        final picture=item['picture'];
        final title = item['title'];
        return ListItem(picture: picture, title: title, index: index, delItem:deleteItem);
      },
    );
  }
}

