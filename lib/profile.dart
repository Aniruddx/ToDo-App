import 'package:flutter/material.dart';



class NinjaCard extends StatefulWidget {
  @override
  State<NinjaCard> createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Profile'),
        titleTextStyle: TextStyle(
          letterSpacing: 2,
          color: Colors.white70,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/GTR.jpg'),
                radius: 40,
              ),
            ),
            SizedBox(height: 100,),
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.white70,
                letterSpacing: 2,
              ),
              ),
              SizedBox(height: 10),
              Text(
              'Anirudh Singh Rathor',
              style: TextStyle(
                fontSize: 30,
                color: Colors.yellowAccent,
                letterSpacing: 2,
              ),
              ),
              SizedBox(height: 50),
            Text(
              'CURRENT STATUS',
              style: TextStyle(
                color: Colors.white70,
                letterSpacing: 2,
              ),
              ),
              SizedBox(height: 10),
              Text(
              'Alpha',
              style: TextStyle(
                fontSize: 30,
                color: Colors.yellowAccent,
                letterSpacing: 2,
              ),
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  Icon(
                    Icons.email_outlined,
                    color: Colors.white70 
                  ),
                  SizedBox(width: 5,),
                  Text(
                    'anisingh4477@gmail.com',
                    style: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 15,
                    ),
                    )
                ],
              )
          ],
        )
        ),
    );
  }
}
