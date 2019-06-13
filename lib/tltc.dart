import 'package:flutter/material.dart';
import 'dart:math';
import 'ExciseDutySlab.dart';

class TLTC extends StatefulWidget {
  @override
  _TLTCState createState() => _TLTCState();
}

class _TLTCState extends State<TLTC> {
  var dutySlabs = ExciseDutySlab.getSlabs();
  double exciseDuty = 0.0;
  final _mrpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TLTC'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Excise Duty'),
              Flexible(
                child: Text(
                  '$exciseDuty',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 50.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        textAlign: TextAlign.center,
                        controller: _mrpController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'MRP',
                          border: UnderlineInputBorder(),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RaisedButton(
                              onPressed: () {
                                setState(() {
                                  _mrpController.clear();
                                  exciseDuty = 0.0;
                                });
                              },
                              child: Text('Clear'),
                            ),
                            RaisedButton(
                              onPressed: () {
                                calculateExciseDuty();
                              },
                              child: Text('Calculate'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void calculateExciseDuty() {
    print("calculate");
    double duty;
    double mrp = double.parse(_mrpController.text);
    if (mrp <= 4000) {
      duty = 1520;
    } else if (mrp > 48000) {
      duty = 3300;
    } else {
      ExciseDutySlab matchedSlab = dutySlabs
          .firstWhere((slab) => slab.mrpFrom <= mrp && slab.mrpTo >= mrp);
      double calculatedDuty = mrp * 0.35 * matchedSlab.factor;
      if (calculatedDuty < matchedSlab.dutyFrom) {
        duty = matchedSlab.dutyFrom.toDouble();
      } else if (calculatedDuty > matchedSlab.dutyTo) {
        duty = matchedSlab.dutyTo.toDouble();
      } else {
        duty = num.parse(calculatedDuty.toStringAsFixed(2));
      }
    }
    setState(() {
      print("New state , Dute = $duty");
      exciseDuty = duty;
    });
  }
}
