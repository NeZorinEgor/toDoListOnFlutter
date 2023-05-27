// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  String _userToDo = '';
  List toDoList = [];

  @override
  void initState() {
    super.initState();
    toDoList.addAll(['Buy milk', 'Wash dishes', 'Купить колу']);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('TO DO LIST'),
        centerTitle: true,
      ),
      body: ListView.builder(
        
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, int index){
          return Dismissible(
            key: Key(toDoList[index]),
             child: Card(
              child: ListTile(title: Text(toDoList[index]),
              trailing: IconButton(icon: Icon(
                Icons.delete_outline,
              ), onPressed: () { 
                setState(() {
                toDoList.removeAt(index);
              });
               },),
              ),
             ),
             onDismissed: (direction){
              setState(() {
                toDoList.removeAt(index);
              });
             } ,
             background: Container(
              color: Colors.red, // Цвет фона при свайпе
            ),
             );
        }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                title: Text('Добавить задачу'),
                content: TextField(
                  onChanged: (String value){
                     _userToDo = value;
                  },
                ),
                actions: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      toDoList.add(_userToDo);
                    });

                    Navigator.of(context).pop();
                  }, child: Text('Add'))
                ],
              );
            });
            
          },
          child: Icon(Icons.add),
        ),
    );
  }
}

