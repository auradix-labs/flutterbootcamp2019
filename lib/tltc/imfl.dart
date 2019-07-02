import 'package:flutter/material.dart';
import 'package:flutter_news/tltc/ExciseDutySlab.dart';

class Imfl extends StatefulWidget {
  @override
  _ImflState createState() => _ImflState();
}

class _ImflState extends State<Imfl> {
  var dutySlabs = ExciseDutySlab.getImflSlabs();
  double exciseDuty = 0.0;
  int slab = 0;
  final _mrpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    'IMFL',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.red),
                  ),
                  Text(
                    'Indian Made Foreign Liquor',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
//            SizedBox(height: 80.0,),
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    'Slab',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    '$slab',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
                  ),
                ],
              ),
            ),

            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    'Excise Duty',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blueGrey),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    '$exciseDuty',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
                  ),
                ],
              ),
            ),

//            Text('Slab: $slab'),
            Container(
//              margin: EdgeInsets.only(top: 50.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: _mrpController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.amberAccent)),
                      prefixText: '₹ ',
                      labelText: 'Price Per Case',
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RaisedButton(
                          padding: const EdgeInsets.all(8.0),
                          textColor: Colors.white,
                          color: Colors.red,
                          onPressed: () {
                            setState(() {
                              _mrpController.clear();
                              exciseDuty = 0.0;
                              slab = 0;
                            });
                          },
                          child: Text('Clear'),
                        ),
                        RaisedButton(
                          padding: const EdgeInsets.all(8.0),
                          textColor: Colors.black87,
                          color: Colors.amber,
                          onPressed: () => calculateExciseDuty(),
                          child: Text('Calculate'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateExciseDuty() {
    double _duty;
    int _slab;
    double mrp = double.parse(_mrpController.text);
    print('Entered MRP: $mrp');
    // find the slab that is matching this mrp
    ExciseDutySlab matchedSlab = dutySlabs
        .firstWhere((slab) => slab.mrpFrom <= mrp && slab.mrpTo >= mrp);
    // matched slab
    _slab = matchedSlab.slab;
    print('Fall in slab no. $_slab');
    //
    double calculatedDuty = mrp * 0.35 * matchedSlab.factor;
    if (calculatedDuty < matchedSlab.dutyFrom) {
      _duty = matchedSlab.dutyFrom.toDouble();
    } else if (calculatedDuty > matchedSlab.dutyTo) {
      _duty = matchedSlab.dutyTo.toDouble();
    } else {
      _duty = num.parse(calculatedDuty.toStringAsFixed(2));
    }

    setState(() {
      print("New state , Dute = $_duty");
      exciseDuty = _duty;
      slab = _slab;
    });
  }
}
