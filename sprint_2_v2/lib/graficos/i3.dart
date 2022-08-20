import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'package:sprint_2/clases/fun_per.dart';
import 'package:sprint_2/clases/cat_per.dart';
import 'dart:convert';

class i3Chart extends StatefulWidget {
  const i3Chart({Key? key}) : super(key: key);

  @override
  I_3 createState() => I_3();
}


class I_3 extends State<i3Chart> {
  List<CatDetails> st=[];
  
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState(){
    _tooltipBehavior=TooltipBehavior(enable: true);
    loadSalesData();
    super.initState();
  }

  Future<String> postJsonFromFirebase() async {
      final headers = {"Content-type": "application/json"};
      final json = '{"id": 3}';
      var response= await http.post(Uri.parse("http://192.168.0.106:5001/DataHighchart"), headers: headers, body: json);
      print(response.body);
      return response.body;
  }

  Future loadSalesData() async {
    final String jsonString= await postJsonFromFirebase();
    final dynamic jsonResponse = json.decode(jsonString);
    for (Map<String, dynamic> i in jsonResponse){
      st.add(CatDetails.fromJson(i));
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
                        //legend: Legend(isVisible: true,overflowMode:LegendItemOverflowMode.wrap),
                        title: ChartTitle(text: 'Demanda de puestos de empleo de TI por categoria y perfil'),
                  
                        series: <ChartSeries>[
                            StackedBarSeries<CatDetails, String>(
                                dataSource: st,
                                xValueMapper: (CatDetails data, _) => data.categoria,
                                yValueMapper: (CatDetails data, _) => data.netDeveloper),
                            StackedBarSeries<CatDetails, String>(
                                dataSource: st,
                                xValueMapper: (CatDetails data, _) => data.categoria,
                                yValueMapper: (CatDetails data, _) =>
                                data.administradorBaseDeDatos),
                            StackedBarSeries<CatDetails, String>(
                                dataSource: st,
                                xValueMapper: (CatDetails data, _) => data.categoria,
                                yValueMapper: (CatDetails data, _) =>data.administradorRedesYComunicaciones),
                            StackedBarSeries<CatDetails, String>(
                                dataSource: st,
                                xValueMapper: (CatDetails data, _) => data.categoria,
                                yValueMapper: (CatDetails data, _) => data.analistaBaseDeDatos),
                            StackedBarSeries<CatDetails, String>(
                                dataSource: st,
                                xValueMapper: (CatDetails data, _) => data.categoria,
                                yValueMapper: (CatDetails data, _) => data.analistaBi),
                            StackedBarSeries<CatDetails, String>(
                                dataSource: st,
                                xValueMapper: (CatDetails data, _) => data.categoria,
                                yValueMapper: (CatDetails data, _) => data.analistaBigdata),
                            StackedBarSeries<CatDetails, String>(
                                dataSource: st,
                                xValueMapper: (CatDetails data, _) => data.categoria,
                                yValueMapper: (CatDetails data, _) => data.analistaBpm),
                            StackedBarSeries<CatDetails, String>(
                                dataSource: st,
                                xValueMapper: (CatDetails data, _) => data.categoria,
                                yValueMapper: (CatDetails data, _) => data.analistaCloud),
                            StackedBarSeries<CatDetails, String>(
                                dataSource: st,
                                xValueMapper: (CatDetails data, _) => data.categoria,
                                yValueMapper: (CatDetails data, _) => data.analistaCrm),
                            StackedBarSeries<CatDetails, String>(
                                dataSource: st,
                                xValueMapper: (CatDetails data, _) => data.categoria,
                                yValueMapper: (CatDetails data, _) =>
                                data.analistaDatawarehouse),
                            StackedBarSeries<CatDetails, String>(
                                dataSource: st,
                                xValueMapper: (CatDetails data, _) => data.categoria,
                                yValueMapper: (CatDetails data, _) =>data.analistaDeCapacitacion),
                            StackedBarSeries<CatDetails, String>(
                                dataSource: st,
                                xValueMapper: (CatDetails data, _) => data.categoria,
                                yValueMapper: (CatDetails data, _) =>data.analistaDeIntegracion),
                            StackedBarSeries<CatDetails, String>(
                                dataSource: st,
                                xValueMapper: (CatDetails data, _) => data.categoria,
                                yValueMapper: (CatDetails data, _) => data.analistaDeProcesos),
                            StackedBarSeries<CatDetails, String>(
                                dataSource: st,
                                xValueMapper: (CatDetails data, _) => data.categoria,
                                yValueMapper: (CatDetails data, _) => data.analistaDeRiesgos),
                            StackedBarSeries<CatDetails, String>(
                                dataSource: st,
                                xValueMapper: (CatDetails data, _) => data.categoria,
                                yValueMapper: (CatDetails data, _) =>
                                data.analistaDeServiciosTi),
                            StackedBarSeries<CatDetails, String>(
                                dataSource: st,
                                xValueMapper: (CatDetails data, _) => data.categoria,
                                yValueMapper: (CatDetails data, _) => data.analistaDeSistemas),
                            StackedBarSeries<CatDetails, String>(
                                dataSource: st,
                                xValueMapper: (CatDetails data, _) => data.categoria,
                                yValueMapper: (CatDetails data, _) =>data.analistaForenseInformatico),
                            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.analistaFuncional),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>
                    data.analistaGestionDeInformacion),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>
                    data.analistaInfraestructuraTi),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.analistaProgramador),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>
                    data.analistaProgramadorBi),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>
                    data.analistaProgramadorPowerBuilder),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>
                    data.analistaProgramadorWeb),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.analistaQa),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>
                    data.analistaRedesYComunicaciones),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>
                    data.analistaSeguridadInformatica),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.analistaServiceDesk),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.analistaTi),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.androidDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.angularDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.arquitectoAndroid),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>
                    data.arquitectoDeSoftware),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.auditorDeSistemas),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.backendAwsDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.backendDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>
                    data.backendJavaDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>
                    data.backendMobileDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.backendNodeJs),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.backendPhp),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.backendPython),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.biDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.biManager),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.bigdataDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.bigdataEngineer),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.blockchainDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.businessDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.cCDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.chatbotDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.cloudArchitect),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.cloudDataEngineer),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.cloudDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.cloudEngineer),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.cmsDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.cmsManager),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.cobolDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.communityManager),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.computerScience),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>data.coordinadorAcademico),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>data.coordinadorBaseDeDatos),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>data.coordinadorServiceDesk),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.dataArchitect),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.dataEngineer),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>
                    data.dataEngineerDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.dataScientist),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.developer),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.developerManager),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.devopsDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.devopsEngineer),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.embeddedDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>
                    data.enterpriseArchitecture),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.especialistaBi),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>
                    data.especialistaCiberseguridad),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.especialistaEcm),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>
                    data.especialistaEcommerce),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.especialistaErp),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>
                    data.especialistaGestionDeInformacion),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.especialistaIa),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>
                    data.especialistaRedesYComunicaciones),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.especialistaTi),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>
                    data.especialistaTransformacinDigital),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.flutterDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.frontendAndroid),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.frontendDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.fullstackDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.gamesDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.genexusDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.gerenteDeTi),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.gestorDeProyectos),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.gestorServiceDesk),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.iosDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.iotDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.javaDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.javascriptDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>
                    data.jefeAutomatizacionRpa),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.jefeDeServiciosTi),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>
                    data.jefeInfraestructuraTi),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.jefeSoporteTecnico),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>
                    data.machineLearningDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>
                    data.microservicesArchitect),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>
                    data.microservicesDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.mobileDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.nodeJsDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.perlDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.phpDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.practicanteTi),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.processManager),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.productManager),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.pythonDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.qaDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.qaManager),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.reactDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.researchExpert),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.rpaDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.rubyDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.salesTiEngineer),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.scalaDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.searchEngineExpert),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.securityEngineer),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.softwareDesign),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.softwareEngineer),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.soporteTecnico),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.sqlDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.systemEngineer),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>
                    data.systemsAdministrator),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.webDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) =>
                    data.webServicesDeveloper),
            StackedBarSeries<CatDetails, String>(
                dataSource: st,
                xValueMapper: (CatDetails data, _) => data.categoria,
                yValueMapper: (CatDetails data, _) => data.webscrapingDeveloper)   
            ]
                    ));  


                    }
                    },  
                )   
            )
        );
    }



}

