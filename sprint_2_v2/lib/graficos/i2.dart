import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'package:sprint_2/clases/fun_per.dart';
import 'dart:convert';

class i2Chart extends StatefulWidget {
  const i2Chart({Key? key}) : super(key: key);

  @override
  I_2 createState() => I_2();
}


class I_2 extends State<i2Chart> {
  List<FunDetails> st=[];
  
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState(){
    _tooltipBehavior=TooltipBehavior(enable: true);
    loadSalesData();
    super.initState();
  }

  Future<String> postJsonFromFirebase() async {
      final headers = {"Content-type": "application/json"};
      final json = '{"id": 2}';
      var response= await http.post(Uri.parse("http://192.168.0.106:5001/DataHighchart"), headers: headers, body: json);
      print(response.body);
      return response.body;
  }

  Future loadSalesData() async {
    final String jsonString= await postJsonFromFirebase();
    final dynamic jsonResponse = json.decode(jsonString);
    for (Map<String, dynamic> i in jsonResponse){
      st.add(FunDetails.fromJson(i));
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
                                      labelFormat: '{value}',
                                      majorTickLines: const MajorTickLines(size: 0)),     
                        title: ChartTitle(text: 'Funciones transversales de Profesionales de TI'),
                  
                        series: <ChartSeries>[
                            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.netDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.administradorBaseDeDatos),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.administradorRedesYComunicaciones),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.analistaBaseDeDatos),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.analistaBi),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.analistaBigdata),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.analistaBpm),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.analistaCloud),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.analistaCrm),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.analistaDatawarehouse),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.analistaDeCapacitacion),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.analistaDeIntegracion),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.analistaDeProcesos),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.analistaDeRiesgos),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.analistaDeServiciosTi),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.analistaDeSistemas),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.analistaForenseInformatico),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.analistaFuncional),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.analistaGestionDeInformacion),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.analistaInfraestructuraTi),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.analistaProgramador),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.analistaProgramadorBi),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.analistaProgramadorPowerBuilder),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.analistaProgramadorWeb),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.analistaQa),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.analistaRedesYComunicaciones),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.analistaSeguridadInformatica),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.analistaServiceDesk),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.analistaTi),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.androidDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.angularDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.arquitectoAndroid),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.arquitectoDeSoftware),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.auditorDeSistemas),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.backendAwsDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.backendDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.backendJavaDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.backendMobileDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.backendNodeJs),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.backendPhp),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.backendPython),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.biDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.biManager),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.bigdataDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.bigdataEngineer),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.blockchainDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.businessDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.cCDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.chatbotDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.cloudArchitect),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.cloudDataEngineer),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.cloudDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.cloudEngineer),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.cmsDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.cmsManager),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.cobolDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.communityManager),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.computerScience),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>data.coordinadorAcademico),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>data.coordinadorBaseDeDatos),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>data.coordinadorServiceDesk),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.dataArchitect),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.dataEngineer),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.dataEngineerDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.dataScientist),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.developer),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.developerManager),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.devopsDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.devopsEngineer),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.embeddedDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.enterpriseArchitecture),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.especialistaBi),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.especialistaCiberseguridad),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.especialistaEcm),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.especialistaEcommerce),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.especialistaErp),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.especialistaGestionDeInformacion),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.especialistaIa),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.especialistaRedesYComunicaciones),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.especialistaTi),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.especialistaTransformacinDigital),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.flutterDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.frontendAndroid),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.frontendDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.fullstackDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.gamesDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.genexusDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.gerenteDeTi),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.gestorDeProyectos),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.gestorServiceDesk),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.iosDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.iotDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.javaDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.javascriptDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.jefeAutomatizacionRpa),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.jefeDeServiciosTi),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.jefeInfraestructuraTi),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.jefeSoporteTecnico),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.machineLearningDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.microservicesArchitect),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.microservicesDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.mobileDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.nodeJsDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.perlDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.phpDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.practicanteTi),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.processManager),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.productManager),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.pythonDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.qaDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.qaManager),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.reactDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.researchExpert),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.rpaDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.rubyDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.salesTiEngineer),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.scalaDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.searchEngineExpert),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.securityEngineer),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.softwareDesign),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.softwareEngineer),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.soporteTecnico),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.sqlDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.systemEngineer),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.systemsAdministrator),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.webDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) =>
                    data.webServicesDeveloper),
            StackedBarSeries<FunDetails, String>(
                dataSource: st,
                xValueMapper: (FunDetails data, _) => data.funcion,
                yValueMapper: (FunDetails data, _) => data.webscrapingDeveloper)   
            ]
                    ));  


                    }
                    },  
                )   
            )
        );
    }



}

