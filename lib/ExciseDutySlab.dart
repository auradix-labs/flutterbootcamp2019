// To parse this JSON data, do
//
//     final exciseDutySlab = exciseDutySlabFromJson(jsonString);

import 'dart:convert';
import 'excise_duty_slabs.dart';
ExciseDutySlab exciseDutySlabFromJson(String str) => ExciseDutySlab.fromMap(json.decode(str));

String exciseDutySlabToJson(ExciseDutySlab data) => json.encode(data.toMap());

class ExciseDutySlab {
  int mrpFrom;
  int mrpTo;
  double factor;
  int dutyFrom;
  int dutyTo;

  ExciseDutySlab({
    this.mrpFrom,
    this.mrpTo,
    this.factor,
    this.dutyFrom,
    this.dutyTo,
  });

  factory ExciseDutySlab.fromMap(Map<String, dynamic> json) => new ExciseDutySlab(
    mrpFrom: json["mrpFrom"],
    mrpTo: json["mrpTo"],
    factor: json["factor"].toDouble(),
    dutyFrom: json["dutyFrom"],
    dutyTo: json["dutyTo"],
  );

  Map<String, dynamic> toMap() => {
    "mrpFrom": mrpFrom,
    "mrpTo": mrpTo,
    "factor": factor,
    "dutyFrom": dutyFrom,
    "dutyTo": dutyTo,
  };
  
  static List<ExciseDutySlab> getSlabs(){
    return slabs.map((slab)=>ExciseDutySlab.fromMap(slab)).toList();
  }
}
