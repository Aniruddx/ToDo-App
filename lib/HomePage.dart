import 'package:flutter/material.dart';
import 'package:todo/Widgets/todoitem.dart';
import 'package:todo/models/todo.dart';

class HomePage extends StatefulWidget{
  //const HomePage({super.key});

final todosList = ToDo.todoList();
final _toDoController = TextEditingController();




  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context ) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      appBar: _buildAppBar(),
      body: Stack (
        children : [
          Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              //searchBox(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10,),
                      child: Text('To Do Lists',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                      ),
                    ),
                    for ( ToDo todoo in widget.todosList ) 
                    todoitem(todo : todoo, 
                    ondeleteItem: _deletetodoItem, 
                    ontodoChanged: _handletodoChange,
                    ),
                    
                  ],
                ),
              )
            ],
          ),
        ),
        Align(
        alignment: Alignment.bottomCenter,
        child: Row( children: [
          Expanded(child: Container( 
            margin: EdgeInsets.only(
              bottom: 10, 
              right: 20,
              left: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
            ),
            child: TextField(
              controller: widget._toDoController,
              decoration: InputDecoration(
                hintText: 'Add new toDo',
                contentPadding: EdgeInsets.only(left: 10, right: 10),
              ),
            ),
          ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20, bottom: 10),
            child: ElevatedButton(
              onPressed: () {
                _addtodoItem(widget._toDoController.text);
              }, 
              child: Icon(Icons.add_box_sharp),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(50,50),
                elevation: 20
              ),
              ),
          )
        ]) ,
      )
        ],
        ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ 
      Icon(Icons.menu_outlined,
      color: Colors.white,
      size: 30,
      ),
      Container(
        height: 45,
        width: 45,
        child: Icon(Icons.home_sharp),
      ),
      
      ]
      ),
    );
  }


void _handletodoChange(ToDo todo){
  setState(() {
  todo.isDone = !todo.isDone;
  });
}

void _deletetodoItem(String id){
  setState(() {
    widget.todosList.removeWhere((item)=> item.id == id);
  });
  
}

void _addtodoItem(String todoText) {
  setState(() {
    widget.todosList.add(
      ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: todoText,
      ),
    );
  });
  widget._toDoController.clear();
}


  /*Widget searchBox() {
    return Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                //borderRadius: BorderRadius.circular(20)
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(5),
                  prefixIcon: Icon(Icons.search_sharp, 
                  color: Colors.white),
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: 18,
                    //maxWidth: 18,
                    minWidth: 15
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white)
                ),
              ),
        );
  }*/
}