import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo/models/todo.dart';
import '../models/todo.dart';

class todoitem extends StatefulWidget {

  final ToDo todo;
  final ontodoChanged;
  final ondeleteItem;
  
  

  const todoitem({Key? key, 
  required this.todo,
  required this.ontodoChanged,
  required this.ondeleteItem,
  
  }) : super(key: key);

  @override
  State<todoitem> createState() => _todoitemState();
}

class _todoitemState extends State<todoitem> {

  final todosList = ToDo.todoList();
  final _toDoController1 = TextEditingController();

  @override

  /*void dispose (){
    _toDoController1.clear();
  }*/
  Widget build(BuildContext context) {
    return GestureDetector( 
      onTap: () {
        widget.ontodoChanged(widget.todo);
      },
      onLongPress: () => {
        //_edittodoItem(widget._toDoController1.text)
      },
    child: Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.deepPurpleAccent,
        leading: Icon(
          widget.todo.isDone? Icons.check_box_outlined : Icons.check_box_outline_blank, 
        color: Colors.white,),
        title: Text(
          widget.todo.todoText!,
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
          decoration: widget.todo.isDone? TextDecoration.lineThrough : null,
        ),
        ),
        
        trailing: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          height: 500,
          width: 30,
          child: IconButton( 
            color: Colors.amberAccent,
            iconSize: 27,
            icon: Icon(Icons.delete_outline),
            onPressed: () {
              widget.ondeleteItem(widget.todo.id);
            },
            ),
        ),
      ),
    ));
  }

 

}