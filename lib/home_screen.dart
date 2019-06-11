import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  // const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [            
            Container(
              margin: EdgeInsets.only(right: 10.0),
              color: Colors.red,
              width: 100.0,
              height: 100.0,
            ),
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.white,
              child: Image.asset('assets/images/logo.png',
              width: 100,),
            ), 
            Text('Custom font', style: TextStyle(
              fontFamily: 'Pacifico'
            ),),
            Icon(Icons.ac_unit)

           
          ],
        ),
      ),
    );
  }
}
