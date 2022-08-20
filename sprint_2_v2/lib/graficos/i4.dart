import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'package:sprint_2/clases/com_per.dart';
import 'dart:convert';

class i4Chart extends StatefulWidget {
  const i4Chart({Key? key}) : super(key: key);

  @override
  I_4 createState() => I_4();
}


class I_4 extends State<i4Chart> {
  List<ComDetails> st=[];
  
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState(){
    _tooltipBehavior=TooltipBehavior(enable: true);
    loadSalesData();
    super.initState();
  }

  Future<String> postJsonFromFirebase() async {
      final headers = {"Content-type": "application/json"};
      final json = '{"id": 4}';
      var response= await http.post(Uri.parse("http://192.168.0.106:5001/DataHighchart"), headers: headers, body: json);
      print(response.body);
      return response.body;
  }

  Future loadSalesData() async {
    final String jsonString= await postJsonFromFirebase();
    final dynamic jsonResponse = json.decode(jsonString);
    for (Map<String, dynamic> i in jsonResponse){
      st.add(ComDetails.fromJson(i));
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
                        //legend: Legend(isVisible: true,overflowMode:LegendItemOverflowMode.wrap),
                        title: ChartTitle(text: 'Demanda de competencias en puestos de empleo de TI'),
                  
                        series: <ChartSeries>[
                          StackedBarSeries<ComDetails, String>(
                                dataSource: st,
                                xValueMapper: (ComDetails data, _) => data.competencias,
                                yValueMapper: (ComDetails data, _) => data.netDeveloper),
                            StackedBarSeries<ComDetails, String>(
                                dataSource: st,
                                xValueMapper: (ComDetails data, _) => data.competencias,
                                yValueMapper: (ComDetails data, _) =>
                                data.administradorBaseDeDatos),
                            StackedBarSeries<ComDetails, String>(
                                dataSource: st,
                                xValueMapper: (ComDetails data, _) => data.competencias,
                                yValueMapper: (ComDetails data, _) =>data.administradorRedesYComunicaciones),
                            StackedBarSeries<ComDetails, String>(
                                dataSource: st,
                                xValueMapper: (ComDetails data, _) => data.competencias,
                                yValueMapper: (ComDetails data, _) => data.analistaBaseDeDatos),
                            StackedBarSeries<ComDetails, String>(
                                dataSource: st,
                                xValueMapper: (ComDetails data, _) => data.competencias,
                                yValueMapper: (ComDetails data, _) => data.analistaBi),
                            StackedBarSeries<ComDetails, String>(
                                dataSource: st,
                                xValueMapper: (ComDetails data, _) => data.competencias,
                                yValueMapper: (ComDetails data, _) => data.analistaBigdata),
                            StackedBarSeries<ComDetails, String>(
                                dataSource: st,
                                xValueMapper: (ComDetails data, _) => data.competencias,
                                yValueMapper: (ComDetails data, _) => data.analistaBpm),
                            StackedBarSeries<ComDetails, String>(
                                dataSource: st,
                                xValueMapper: (ComDetails data, _) => data.competencias,
                                yValueMapper: (ComDetails data, _) => data.analistaCloud),
                            StackedBarSeries<ComDetails, String>(
                                dataSource: st,
                                xValueMapper: (ComDetails data, _) => data.competencias,
                                yValueMapper: (ComDetails data, _) => data.analistaCrm),
                            StackedBarSeries<ComDetails, String>(
                                dataSource: st,
                                xValueMapper: (ComDetails data, _) => data.competencias,
                                yValueMapper: (ComDetails data, _) =>
                                data.analistaDatawarehouse),
                            StackedBarSeries<ComDetails, String>(
                                dataSource: st,
                                xValueMapper: (ComDetails data, _) => data.competencias,
                                yValueMapper: (ComDetails data, _) =>data.analistaDeCapacitacion),
                            StackedBarSeries<ComDetails, String>(
                                dataSource: st,
                                xValueMapper: (ComDetails data, _) => data.competencias,
                                yValueMapper: (ComDetails data, _) =>data.analistaDeIntegracion),
                            StackedBarSeries<ComDetails, String>(
                                dataSource: st,
                                xValueMapper: (ComDetails data, _) => data.competencias,
                                yValueMapper: (ComDetails data, _) => data.analistaDeProcesos),
                            StackedBarSeries<ComDetails, String>(
                                dataSource: st,
                                xValueMapper: (ComDetails data, _) => data.competencias,
                                yValueMapper: (ComDetails data, _) => data.analistaDeRiesgos),
                            StackedBarSeries<ComDetails, String>(
                                dataSource: st,
                                xValueMapper: (ComDetails data, _) => data.competencias,
                                yValueMapper: (ComDetails data, _) =>
                                data.analistaDeServiciosTi),
                            StackedBarSeries<ComDetails, String>(
                                dataSource: st,
                                xValueMapper: (ComDetails data, _) => data.competencias,
                                yValueMapper: (ComDetails data, _) => data.analistaDeSistemas),
                            StackedBarSeries<ComDetails, String>(
                                dataSource: st,
                                xValueMapper: (ComDetails data, _) => data.competencias,
                                yValueMapper: (ComDetails data, _) =>data.analistaForenseInformatico),
                            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.analistaFuncional),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>
                    data.analistaGestionDeInformacion),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>
                    data.analistaInfraestructuraTi),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.analistaProgramador),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>
                    data.analistaProgramadorBi),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>
                    data.analistaProgramadorPowerBuilder),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>
                    data.analistaProgramadorWeb),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.analistaQa),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>
                    data.analistaRedesYComunicaciones),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>
                    data.analistaSeguridadInformatica),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.analistaServiceDesk),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.analistaTi),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.androidDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.angularDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.arquitectoAndroid),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>
                    data.arquitectoDeSoftware),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.auditorDeSistemas),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.backendAwsDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.backendDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>
                    data.backendJavaDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>
                    data.backendMobileDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.backendNodeJs),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.backendPhp),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.backendPython),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.biDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.biManager),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.bigdataDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.bigdataEngineer),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.blockchainDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.businessDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.cCDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.chatbotDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.cloudArchitect),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.cloudDataEngineer),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.cloudDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.cloudEngineer),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.cmsDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.cmsManager),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.cobolDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.communityManager),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.computerScience),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>data.coordinadorAcademico),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>data.coordinadorBaseDeDatos),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>data.coordinadorServiceDesk),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.dataArchitect),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.dataEngineer),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>
                    data.dataEngineerDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.dataScientist),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.developer),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.developerManager),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.devopsDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.devopsEngineer),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.embeddedDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>
                    data.enterpriseArchitecture),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.especialistaBi),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>
                    data.especialistaCiberseguridad),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.especialistaEcm),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>
                    data.especialistaEcommerce),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.especialistaErp),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>
                    data.especialistaGestionDeInformacion),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.especialistaIa),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>
                    data.especialistaRedesYComunicaciones),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.especialistaTi),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>
                    data.especialistaTransformacinDigital),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.flutterDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.frontendAndroid),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.frontendDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.fullstackDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.gamesDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.genexusDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.gerenteDeTi),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.gestorDeProyectos),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.gestorServiceDesk),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.iosDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.iotDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.javaDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.javascriptDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>
                    data.jefeAutomatizacionRpa),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.jefeDeServiciosTi),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>
                    data.jefeInfraestructuraTi),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.jefeSoporteTecnico),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>
                    data.machineLearningDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>
                    data.microservicesArchitect),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>
                    data.microservicesDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.mobileDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.nodeJsDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.perlDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.phpDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.practicanteTi),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.processManager),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.productManager),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.pythonDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.qaDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.qaManager),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.reactDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.researchExpert),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.rpaDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.rubyDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.salesTiEngineer),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.scalaDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.searchEngineExpert),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.securityEngineer),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.softwareDesign),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.softwareEngineer),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.soporteTecnico),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.sqlDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.systemEngineer),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>
                    data.systemsAdministrator),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.webDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) =>
                    data.webServicesDeveloper),
            StackedBarSeries<ComDetails, String>(
                dataSource: st,
                xValueMapper: (ComDetails data, _) => data.competencias,
                yValueMapper: (ComDetails data, _) => data.webscrapingDeveloper)
                        ]
                    ));  


                    }
                    },  
                )   
            )
        );
    }



}

