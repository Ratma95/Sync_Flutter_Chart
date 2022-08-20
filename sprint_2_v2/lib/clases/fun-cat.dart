import 'dart:convert';



class PerfDetails {
    PerfDetails(
        this.architect,
        this.artificialIntelligence,
        this.businessIntelligence,
        this.cloudComputing,
        this.communicationNetworking,
        this.computerScienceSystemsAndSoftware,
        this.cybersecurity,
        this.database,
        this.developer,
        this.digitalBusinessProcess,
        this.funcion,
        this.informationAndKnowledgeManagement,
        this.itServices,
        this.manager,
        this.qualitySoftware,
        this.serversContainersVirtualization,
        this.serviceDesk,
        this.softwareDesign,
        this.systemAnalysis,
        this.trainingAndResearch,
    );

    final int architect;
    final int artificialIntelligence;
    final int businessIntelligence;
    final int cloudComputing;
    final int communicationNetworking;
    final int computerScienceSystemsAndSoftware;
    final int cybersecurity;
    final int database;
    final int developer;
    final int digitalBusinessProcess;
    final String funcion;
    final int informationAndKnowledgeManagement;
    final int itServices;
    final int manager;
    final int qualitySoftware;
    final int serversContainersVirtualization;
    final int serviceDesk;
    final int softwareDesign;
    final int systemAnalysis;
    final int trainingAndResearch;



    factory PerfDetails.fromJson(Map<String, dynamic> parsedJson) {
        return PerfDetails(
        
        parsedJson["ARCHITECT"],
        parsedJson["ARTIFICIAL INTELLIGENCE"],
        parsedJson["BUSINESS INTELLIGENCE"],
        parsedJson["CLOUD COMPUTING"],
        parsedJson["COMMUNICATION & NETWORKING"],
        parsedJson["COMPUTER SCIENCE, SYSTEMS AND SOFTWARE"],
        parsedJson["CYBERSECURITY"],
        parsedJson["DATABASE"],
        parsedJson["DEVELOPER"],
        parsedJson["DIGITAL BUSINESS PROCESS"],
        parsedJson["FUNCION"].toString(),
        parsedJson["INFORMATION AND KNOWLEDGE MANAGEMENT"],
        parsedJson["IT SERVICES"],
        parsedJson["MANAGER"],
        parsedJson["QUALITY SOFTWARE"],
        parsedJson["SERVERS-CONTAINERS-VIRTUALIZATION"],
        parsedJson["SERVICE DESK"],
        parsedJson["SOFTWARE DESIGN"],
        parsedJson["SYSTEM ANALYSIS"],
        parsedJson["TRAINING AND RESEARCH"],
    );

    
    }
}