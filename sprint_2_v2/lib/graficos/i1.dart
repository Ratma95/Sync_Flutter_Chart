import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class DonutChart extends StatefulWidget {
  const DonutChart({Key? key}) : super(key: key);

  @override
  Grafico_donut createState() => Grafico_donut();
}


class Grafico_donut extends State<DonutChart> {
  List<WebDetails> web=[];
  
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState(){
    _tooltipBehavior = TooltipBehavior(enable: true);
    loadSalesData();
    super.initState();
  }

  Future<String> postJsonFromFirebase() async {
      final headers = {"Content-type": "application/json"};
      final json = '{"id": 1}';
      var response= await http.post(Uri.parse("http://192.168.0.106:5001/DataHighchart"), headers: headers, body: json);
      print(response.body);
      return response.body;
  }

  Future loadSalesData() async {
    final String jsonString= await postJsonFromFirebase();
    final dynamic jsonResponse = json.decode(jsonString);
    for (Map<String, dynamic> i in jsonResponse){
      web.add(WebDetails.fromJson(i));
      print(web);

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
                        title: ChartTitle(text: 'Empleos por pagina web'),
                        legend: Legend(isVisible: true,overflowMode:LegendItemOverflowMode.wrap),
                        tooltipBehavior: _tooltipBehavior,
                        series: <CircularSeries>[
                            // Renders doughnut chart
                            DoughnutSeries<WebDetails, String>(
                                dataSource: web,

                                xValueMapper: (WebDetails data, _) => data.valor,
                                yValueMapper: (WebDetails data, _) => data.cant,
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


class WebDetails{
  WebDetails(this.valor,this.cant);
  final String valor;
  final int cant;

  factory WebDetails.fromJson(Map<String,dynamic> parsedJson){
    return WebDetails(
      parsedJson['valor'].toString(), parsedJson['cant'] 
    );
  }


}
