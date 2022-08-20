import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sprint_2/clases/dashboard.dart';
import 'dart:convert';


Future<List<Dash>> d() async{ 
    var response= await http.get(Uri.parse("http://192.168.0.106:5001/Dashboard"));
    if (response.statusCode == 200) {
        // Si la llamada al servidor fue exitosa, analiza el JSON
        //print(response.body);
        //return compute(dashboardFromJson,response.body);
        var jsonData = json.decode(response.body);
        List<Dash> fcs = [];
        
        for (var u in jsonData) {
          Dash fc = Dash(u["valor"]);
          fcs.add(fc);
        }
        print(fcs);
        return fcs;  
    } else {
        // Si la llamada no fue exitosa, lanza un error.
        throw Exception('Failed to load post');
    } 
}

