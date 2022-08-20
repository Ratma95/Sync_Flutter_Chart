import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class i11Chart extends StatefulWidget {
  const i11Chart({Key? key}) : super(key: key);

  @override
  Grafico_circular createState() => Grafico_circular();
}


class Grafico_circular extends State<i11Chart> {
  List<ActDetails> st=[];
  
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState(){
    _tooltipBehavior = TooltipBehavior(enable: true);
    loadSalesData();
    super.initState();
  }

  Future<String> postJsonFromFirebase() async {
      final headers = {"Content-type": "application/json"};
      final json = '{"id": 11}';
      var response= await http.post(Uri.parse("http://192.168.0.106:5001/DataHighchart"), headers: headers, body: json);
      print(response.body);
      return response.body;
  }

  Future loadSalesData() async {
    final String jsonString= await postJsonFromFirebase();
    final dynamic jsonResponse = json.decode(jsonString);
    for (Map<String, dynamic> i in jsonResponse){
      st.add(ActDetails.fromJson(i));
      print(st);

    }
  }

  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
      body: FutureBuilder(
        future: postJsonFromFirebase(), 
        builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
              }else{return (SfCircularChart(
                        title: ChartTitle(text: 'Participacion por sexo'),
                        legend: Legend(isVisible: true,overflowMode:LegendItemOverflowMode.wrap),
                        tooltipBehavior: _tooltipBehavior,
                        series: <CircularSeries>[
                            // Renders doughnut chart
                            PieSeries<ActDetails, String>(
                                dataSource: st,

                                xValueMapper: (ActDetails data, _) => data.sexo,
                                yValueMapper: (ActDetails data, _) => data.cant,
                                dataLabelSettings: DataLabelSettings(isVisible: true),
                                enableTooltip: true

                            )
                        ]
              ));}
          },  
        ) 
      ) 
    );
  }
}


class ActDetails{
  ActDetails(this.sexo,this.cant);
  final String sexo;
  final int cant;

  factory ActDetails.fromJson(Map<String,dynamic> parsedJson){
    return ActDetails(
      parsedJson['sexo'].toString(), parsedJson['cant'] 
    );
  }


}