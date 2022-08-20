import 'package:flutter/material.dart';
import 'package:high_chart/high_chart.dart';
import 'package:sprint_2/graficos/i1.dart';
import 'package:sprint_2/graficos/i2.dart';
import 'package:sprint_2/graficos/i3.dart';
import 'package:sprint_2/graficos/i4.dart';
import 'package:sprint_2/graficos/i4.dart';
import 'package:sprint_2/graficos/i5.dart';
import 'package:sprint_2/graficos/i11.dart';
import 'package:sprint_2/http_get.dart';
import 'package:sprint_2/clases/dashboard.dart';
import 'dart:convert';



void main() { 
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 102, 165, 173),
          foregroundColor: Colors.white,
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text("Inwedelati-Syncfusion Chart")
      ),body: Center(child: FutureBuilder<List<Dash>>(
          future: d(),
          builder: (BuildContext context, AsyncSnapshot<List<Dash>> snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return DropdownButton<String>(
                hint: Text("Seleccione opcion"),
                onChanged: (_value)=>{
                      if(_value=="1.Dashboard"){
                        Navigator.of(context).push(MaterialPageRoute(
                        builder:(context)=> DonutChart(),
                        ))
                      }, 
                      if(_value=="2.Funcion-Perfil"){
                        Navigator.of(context).push(MaterialPageRoute(
                        builder:(context)=> i2Chart(),
                        ))
                      },
                      if(_value=="3.Categoria-Perfil"){
                        Navigator.of(context).push(MaterialPageRoute(
                        builder:(context)=> i3Chart(),
                        ))
                      },
                      if(_value=="4.Competencias-Perfil"){
                        Navigator.of(context).push(MaterialPageRoute(
                        builder:(context)=> i4Chart(),
                        ))
                      },
                      if(_value=="5.Funcion-Categoria"){
                        Navigator.of(context).push(MaterialPageRoute(
                        builder:(context)=> i5Chart(),
                        ))
                      },
                      if(_value=="6.Beneficio-Empresa"){
                        Navigator.of(context).push(MaterialPageRoute(
                        builder:(context)=> i3Chart(),
                        ))
                      },
                      if(_value=="11.ilostat-sexo"){
                        Navigator.of(context).push(MaterialPageRoute(
                        builder:(context)=> i11Chart(),
                        ))
                      },   
                },
                items: snapshot.data!.map((fc) =>
                        DropdownMenuItem<String>(
                          child: Text(fc.valor),
                          value: fc.valor,
                        )
                      ).toList(),
                );
              },
            ),
          )       
        );
    }
}



/*
class _MyHomePageState extends State<MyHomePage> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Credit cards")
      ),body: FutureBuilder<List<Dash>>(
          future: d(),
          builder: (context, snapshot) {
            return DropdownButton<String>(
                hint: Text("Seleccione opcion"),
                onChanged: (_value)=>{
                      Navigator.of(context).push(MaterialPageRoute(
                      builder:(context)=> Grafico_linea(),
                  ))
                },
                items: snapshot.data!.map((fc) =>
                        DropdownMenuItem<String>(
                          child: Text(fc.valor),
                          value: fc.valor,
                        )
                      ).toList(),
                );
              },
            ),
              
        );
    }
}
*/




/*body: FutureBuilder<List<dynamic>?>(
        future: miprueba().dashboard,
          builder: (context, snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator.adaptive());
              }
              final List<dynamic>? dashboard = snapshot.data;
              return const Center(child: DropdownButton(
                  items: _lista.map((String a){
                  return DropdownMenuItem(
                  value: a,
                   child: Text(a));
                  }).toList(),
              onChanged: (_value)=>{
            if(_value=="casa"){
              Navigator.of(context).push(MaterialPageRoute(
                  builder:(context)=> Grafico_linea(),
                  ))
            }  
          },
          
          hint: Text(_vista),
*/
/*class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 196, 223, 230),
      appBar: AppBar(
        title: Text('Ejemplos High Chart  - TGS'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: <Widget>[
            
            RaisedButton(
              child: Text("Gráfico de linea",style: TextStyle(fontSize: 23.0,),),
              shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),

                      ),
              padding: const EdgeInsets.only(
                      top: 8, bottom: 8, left:95, right: 95),       
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder:(context)=> Grafico_linea(),
                  ));
              },
            
            ),
           RaisedButton(
              child: Text("Gráfico de barra",style: TextStyle(fontSize: 23.0,),),
              shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      ),
              padding: const EdgeInsets.only(
                      top: 8, bottom: 8, left: 95, right: 95),      
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder:(context)=> Grafico_barra(),
                  ));  
              },
            ),
            RaisedButton(
              child: Text("Gráfico circular",style: TextStyle(fontSize: 23.0,),),
              shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.only(
                      top: 8, bottom: 8, left: 95, right:95),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder:(context)=> Grafico_pastel(),
                  ));
              },
            ),
            RaisedButton(
              child: Text("Grafico de dispersion",style: TextStyle(fontSize: 23.0,),),
              shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      ),
              padding: const EdgeInsets.only(
                      top: 8, bottom: 8, left:68, right: 68),       
              onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                  builder:(context)=> Grafico_dispersion(),
                  ));
              },
            ),
            RaisedButton(
              child: Text("Gráfico de columna apilada",style: TextStyle(fontSize: 23.0,),),
              shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      ),
              padding: const EdgeInsets.only(
                      top: 8, bottom: 8, left: 38, right: 38),     
              onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                  builder:(context)=> Grafico_columna(),
                  ));
              },
            ),
            RaisedButton(
              child: Text("Gráfico de Area",style: TextStyle(fontSize: 23.0,),),
              shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      ),
              padding: const EdgeInsets.only(
                      top: 8, bottom: 8, left: 98, right: 98),     
              onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                  builder:(context)=> Grafico_area(),
                  ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
*/

