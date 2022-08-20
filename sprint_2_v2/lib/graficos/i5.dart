import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'package:sprint_2/clases/fun_per.dart';
import 'package:sprint_2/clases/fun-cat.dart';
import 'package:sprint_2/clases/com_per.dart';
import 'dart:convert';

class i5Chart extends StatefulWidget {
  const i5Chart({Key? key}) : super(key: key);

  @override
  I_5 createState() => I_5();
}


class I_5 extends State<i5Chart> {
  List<PerfDetails> st=[];
  
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState(){
    _tooltipBehavior=TooltipBehavior(enable: true);
    loadSalesData();
    super.initState();
  }

  Future<String> postJsonFromFirebase() async {
      final headers = {"Content-type": "application/json"};
      final json = '{"id": 5}';
      var response= await http.post(Uri.parse("http://192.168.0.106:5001/DataHighchart"), headers: headers, body: json);
      return response.body;
  }

  Future loadSalesData() async {
    final String jsonString= await postJsonFromFirebase();
    final dynamic jsonResponse = json.decode(jsonString);
    for (Map<String, dynamic> i in jsonResponse){
      st.add(PerfDetails.fromJson(i));
      print(st);

    }
  }

  Widget build(BuildContext context) {
         return Scaffold(
            body: Center(
                child: FutureBuilder(
                    future: postJsonFromFirebase(),
                    builder: ( context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }else{
                      return Center(child: SfCartesianChart(
                        plotAreaBorderWidth: 1,
                        primaryXAxis: CategoryAxis(majorGridLines: const MajorGridLines(width: 0),),
                        primaryYAxis: NumericAxis(
                                      axisLine: const AxisLine(width: 0),
                                      
                                      majorTickLines: const MajorTickLines(size: 0)),     
                        //legend: Legend(isVisible: true,overflowMode:LegendItemOverflowMode.wrap),
                        title: ChartTitle(text: 'Demanda de funciones en puestos de empleo de TI'),
                  
                        series: <ChartSeries>[
                              StackedBarSeries<PerfDetails, String>(
                                dataSource: st,
                                xValueMapper: (PerfDetails data, _) => data.funcion,
                                yValueMapper: (PerfDetails data, _) => data.architect),
                            StackedBarSeries<PerfDetails, String>(
                                dataSource: st,
                                xValueMapper: (PerfDetails data, _) => data.funcion,
                                yValueMapper: (PerfDetails data, _) =>
                                data.artificialIntelligence),
                            StackedBarSeries<PerfDetails, String>(
                                dataSource: st,
                                xValueMapper: (PerfDetails data, _) => data.funcion,
                                yValueMapper: (PerfDetails data, _) =>data.businessIntelligence),
                            StackedBarSeries<PerfDetails, String>(
                                dataSource: st,
                                xValueMapper: (PerfDetails data, _) => data.funcion,
                                yValueMapper: (PerfDetails data, _) => data.cloudComputing),
                            StackedBarSeries<PerfDetails, String>(
                                dataSource: st,
                                xValueMapper: (PerfDetails data, _) => data.funcion,
                                yValueMapper: (PerfDetails data, _) => data.communicationNetworking),
                            StackedBarSeries<PerfDetails, String>(
                                dataSource: st,
                                xValueMapper: (PerfDetails data, _) => data.funcion,
                                yValueMapper: (PerfDetails data, _) => data.computerScienceSystemsAndSoftware),
                            StackedBarSeries<PerfDetails, String>(
                                dataSource: st,
                                xValueMapper: (PerfDetails data, _) => data.funcion,
                                yValueMapper: (PerfDetails data, _) => data.cybersecurity),
                            StackedBarSeries<PerfDetails, String>(
                                dataSource: st,
                                xValueMapper: (PerfDetails data, _) => data.funcion,
                                yValueMapper: (PerfDetails data, _) => data.database),
                            StackedBarSeries<PerfDetails, String>(
                                dataSource: st,
                                xValueMapper: (PerfDetails data, _) => data.funcion,
                                yValueMapper: (PerfDetails data, _) => data.developer),
                            StackedBarSeries<PerfDetails, String>(
                                dataSource: st,
                                xValueMapper: (PerfDetails data, _) => data.funcion,
                                yValueMapper: (PerfDetails data, _) =>
                                data.digitalBusinessProcess),
                            StackedBarSeries<PerfDetails, String>(
                                dataSource: st,
                                xValueMapper: (PerfDetails data, _) => data.funcion,
                                yValueMapper: (PerfDetails data, _) =>data.informationAndKnowledgeManagement),
                            StackedBarSeries<PerfDetails, String>(
                                dataSource: st,
                                xValueMapper: (PerfDetails data, _) => data.funcion,
                                yValueMapper: (PerfDetails data, _) =>data.itServices),
                            StackedBarSeries<PerfDetails, String>(
                                dataSource: st,
                                xValueMapper: (PerfDetails data, _) => data.funcion,
                                yValueMapper: (PerfDetails data, _) => data.manager),
                            StackedBarSeries<PerfDetails, String>(
                                dataSource: st,
                                xValueMapper: (PerfDetails data, _) => data.funcion,
                                yValueMapper: (PerfDetails data, _) => data.qualitySoftware),
                            StackedBarSeries<PerfDetails, String>(
                                dataSource: st,
                                xValueMapper: (PerfDetails data, _) => data.funcion,
                                yValueMapper: (PerfDetails data, _) =>
                                data.serversContainersVirtualization),
                            StackedBarSeries<PerfDetails, String>(
                                dataSource: st,
                                xValueMapper: (PerfDetails data, _) => data.funcion,
                                yValueMapper: (PerfDetails data, _) => data.serviceDesk),
                            StackedBarSeries<PerfDetails, String>(
                                dataSource: st,
                                xValueMapper: (PerfDetails data, _) => data.funcion,
                                yValueMapper: (PerfDetails data, _) =>data.softwareDesign),
                            StackedBarSeries<PerfDetails, String>(
                                dataSource: st,
                                xValueMapper: (PerfDetails data, _) => data.funcion,
                                yValueMapper: (PerfDetails data, _) => data.systemAnalysis),
                            StackedBarSeries<PerfDetails, String>(
                                dataSource: st,
                                xValueMapper: (PerfDetails data, _) => data.funcion,
                                yValueMapper: (PerfDetails data, _) =>
                                    data.trainingAndResearch)
                            
            ]
                    ));  


                    }
                    },  
                )   
            )
        );
    }



}

