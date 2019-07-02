import 'dart:convert';
import 'package:flutter_news/tltc/excise_duty_slabs.dart';
ExciseDutySlab exciseDutySlabFromJson(String str) => ExciseDutySlab.fromMap(json.decode(str));

String exciseDutySlabToJson(ExciseDutySlab data) => json.encode(data.toMap());

class ExciseDutySlab {
  int slab;
  double mrpFrom;
  double mrpTo;
  double factor;
  double dutyFrom;
  double dutyTo;

  ExciseDutySlab({
    this.slab,
    this.mrpFrom,
    this.mrpTo,
    this.factor,
    this.dutyFrom,
    this.dutyTo,
  });

  factory ExciseDutySlab.fromMap(Map<String, dynamic> map) => new ExciseDutySlab(
    slab: map["slab"],
    mrpFrom: map["mrpFrom"],
    mrpTo: map["mrpTo"],
    factor: map["factor"],
    dutyFrom: map["dutyFrom"],
    dutyTo: map["dutyTo"],
  );

  Map<String, dynamic> toMap() => {
    "slab":slab,
    "mrpFrom": mrpFrom,
    "mrpTo": mrpTo,
    "factor": factor,
    "dutyFrom": dutyFrom,
    "dutyTo": dutyTo,
  };
  
  static List<ExciseDutySlab> getImflSlabs(){
    return imflSlabs.map((item)=>ExciseDutySlab.fromMap(item)).toList();
  }
  static List<ExciseDutySlab> getBeer650Slabs(){
    return beer650Slabs.map((slab)=>ExciseDutySlab.fromMap(slab)).toList();
  }
  static List<ExciseDutySlab> getBeer500Slabs(){
    return beer500Slabs.map((slab)=>ExciseDutySlab.fromMap(slab)).toList();
  }
}
