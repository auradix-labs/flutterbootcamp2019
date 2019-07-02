import 'package:flutter/material.dart';
import 'beer500.dart';
import 'beer650.dart';
import 'imfl.dart';

class TLTC extends StatefulWidget {
  @override
  _TLTCState createState() => _TLTCState();
}

class _TLTCState extends State<TLTC> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(

        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Excise Duty Calculator",
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 3.0,),
              Text(
                "For Foreign Liquor & Beer in Tripura",
                style: TextStyle(fontSize: 11.0,color: Colors.blueGrey,fontWeight: FontWeight.bold),
              ),
//              Text(
//                "TLTC",
//                style: TextStyle(fontSize: 24.0),
//              ),
//              Text(
//                "Tripura Liquor Tax Calculator",
//                style: TextStyle(fontSize: 12.0),
//              ),
            ],
          ),
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.local_bar),
              text: "IMFL",
            ),
            Tab(
                icon: Icon(Icons.local_drink),
              text: "BEER 650 ml",
            ),
            Tab(
                icon: Icon(Icons.local_drink),
              text: "BEER 500 ml",
            ),
          ],
          labelColor: Colors.amber,
          unselectedLabelColor: Colors.blue,
//          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 3.0,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.red,
        ),
        body: TabBarView(
          children: <Widget>[
            Imfl(),
            Beer650(),
            Beer500(),
          ],
        ),
      ),
    );
  }
}
