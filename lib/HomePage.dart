//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:todo/Widgets/todoitem.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/profile.dart';
import 'package:todo/progress.dart';

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
      backgroundColor: Colors.black87,
      
      appBar: _buildAppBar(),
      
      body: Stack (
        children : [
          Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20),
              //searchBox(),
              Expanded(
                child: ListView(
                  children: [
                    /*Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10,),
                      child: Text('To Do Lists',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                      ),
                    ),*/
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
        child: Row( 
          children: [
            
          Expanded(child: Container( 
            margin: EdgeInsets.only(
              bottom: 10, 
              right: 20,
              left: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.black87,            
            ),
            child: TextField(
              cursorColor: Colors.white70,
              style: TextStyle(
                color: Colors.white70,
                letterSpacing: 2,
              ),
              controller: widget._toDoController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Add a new task',
                hintStyle: TextStyle(
                  letterSpacing: 2,
                  fontSize: 13,
                  color: Colors.white70,
                ),
                fillColor: Colors.white70,
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
              child: Icon(Icons.add_box_outlined),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(50,50),
                elevation: 20,
                backgroundColor: Colors.black87,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
      children: [ 
      ElevatedButton( 
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black87
          ),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/GTR.jpg'),
          radius: 20,
        ),
        onPressed: () {
          setState(() { Navigator.push(context, 
          MaterialPageRoute(builder: ((context) => NinjaCard())));
          });
        },
      ),

      Text(
        'To Do Lists',
        style: TextStyle(
          fontSize: 23,
          letterSpacing: 2
        ),
      ),
      
      IconButton(
        iconSize: 30,
        icon: const Icon(
          Icons.menu_outlined), 
        onPressed: () {
          setState(() { Navigator.push(context, MaterialPageRoute(builder: ((context) => progress())));
          });
        },
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



