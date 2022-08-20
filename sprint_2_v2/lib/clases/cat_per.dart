import 'dart:convert';

class CatDetails {
    CatDetails(
        this.netDeveloper,
        this.administradorBaseDeDatos,
        this.administradorRedesYComunicaciones,
        this.analistaBaseDeDatos,
        this.analistaBi,
        this.analistaBigdata,
        this.analistaBpm,
        this.analistaCloud,
        this.analistaCrm,
        this.analistaDatawarehouse,
        this.analistaDeCapacitacion,
        this.analistaDeIntegracion,
        this.analistaDeProcesos,
        this.analistaDeRiesgos,
        this.analistaDeServiciosTi,
        this.analistaDeSistemas,
        this.analistaForenseInformatico,
        this.analistaFuncional,
        this.analistaGestionDeInformacion,
        this.analistaInfraestructuraTi,
        this.analistaProgramador,
        this.analistaProgramadorBi,
        this.analistaProgramadorPowerBuilder,
        this.analistaProgramadorWeb,
        this.analistaQa,
        this.analistaRedesYComunicaciones,
        this.analistaSeguridadInformatica,
        this.analistaServiceDesk,
        this.analistaTi,
        this.androidDeveloper,
        this.angularDeveloper,
        this.arquitectoAndroid,
        this.arquitectoDeSoftware,
        this.auditorDeSistemas,
        this.backendAwsDeveloper,
        this.backendDeveloper,
        this.backendJavaDeveloper,
        this.backendMobileDeveloper,
        this.backendNodeJs,
        this.backendPhp,
        this.backendPython,
        this.biDeveloper,
        this.biManager,
        this.bigdataDeveloper,
        this.bigdataEngineer,
        this.blockchainDeveloper,
        this.businessDeveloper,
        this.cCDeveloper,
        this.chatbotDeveloper,
        this.cloudArchitect,
        this.cloudDataEngineer,
        this.cloudDeveloper,
        this.cloudEngineer,
        this.cmsDeveloper,
        this.cmsManager,
        this.cobolDeveloper,
        this.communityManager,
        this.computerScience,
        this.coordinadorAcademico,
        this.coordinadorBaseDeDatos,
        this.coordinadorServiceDesk,
        this.dataArchitect,
        this.dataEngineer,
        this.dataEngineerDeveloper,
        this.dataScientist,
        this.developer,
        this.developerManager,
        this.devopsDeveloper,
        this.devopsEngineer,
        this.embeddedDeveloper,
        this.enterpriseArchitecture,
        this.especialistaBi,
        this.especialistaCiberseguridad,
        this.especialistaEcm,
        this.especialistaEcommerce,
        this.especialistaErp,
        this.especialistaGestionDeInformacion,
        this.especialistaIa,
        this.especialistaRedesYComunicaciones,
        this.especialistaTi,
        this.especialistaTransformacinDigital,
        this.flutterDeveloper,
        this.frontendAndroid,
        this.frontendDeveloper,
        this.fullstackDeveloper,
        this.categoria,
        this.gamesDeveloper,
        this.genexusDeveloper,
        this.gerenteDeTi,
        this.gestorDeProyectos,
        this.gestorServiceDesk,
        this.iosDeveloper,
        this.iotDeveloper,
        this.javaDeveloper,
        this.javascriptDeveloper,
        this.jefeAutomatizacionRpa,
        this.jefeDeServiciosTi,
        this.jefeInfraestructuraTi,
        this.jefeSoporteTecnico,
        this.machineLearningDeveloper,
        this.microservicesArchitect,
        this.microservicesDeveloper,
        this.mobileDeveloper,
        this.nodeJsDeveloper,
        this.perlDeveloper,
        this.phpDeveloper,
        this.practicanteTi,
        this.processManager,
        this.productManager,
        this.pythonDeveloper,
        this.qaDeveloper,
        this.qaManager,
        this.reactDeveloper,
        this.researchExpert,
        this.rpaDeveloper,
        this.rubyDeveloper,
        this.salesTiEngineer,
        this.scalaDeveloper,
        this.searchEngineExpert,
        this.securityEngineer,
        this.softwareDesign,
        this.softwareEngineer,
        this.soporteTecnico,
        this.sqlDeveloper,
        this.systemEngineer,
        this.systemsAdministrator,
        this.webDeveloper,
        this.webServicesDeveloper,
        this.webscrapingDeveloper,
    );

    final int netDeveloper;
    final int administradorBaseDeDatos;
    final int administradorRedesYComunicaciones;
    final int analistaBaseDeDatos;
    final int analistaBi;
    final int analistaBigdata;
    final int analistaBpm;
    final int analistaCloud;
    final int analistaCrm;
    final int analistaDatawarehouse;
    final int analistaDeCapacitacion;
    final int analistaDeIntegracion;
    final int analistaDeProcesos;
    final int analistaDeRiesgos;
    final int analistaDeServiciosTi;
    final int analistaDeSistemas;
    final int analistaForenseInformatico;
    final int analistaFuncional;
    final int analistaGestionDeInformacion;
    final int analistaInfraestructuraTi;
    final int analistaProgramador;
    final int analistaProgramadorBi;
    final int analistaProgramadorPowerBuilder;
    final int analistaProgramadorWeb;
    final int analistaQa;
    final int analistaRedesYComunicaciones;
    final int analistaSeguridadInformatica;
    final int analistaServiceDesk;
    final int analistaTi;
    final int androidDeveloper;
    final int angularDeveloper;
    final int arquitectoAndroid;
    final int arquitectoDeSoftware;
    final int auditorDeSistemas;
    final int backendAwsDeveloper;
    final int backendDeveloper;
    final int backendJavaDeveloper;
    final int backendMobileDeveloper;
    final int backendNodeJs;
    final int backendPhp;
    final int backendPython;
    final int biDeveloper;
    final int biManager;
    final int bigdataDeveloper;
    final int bigdataEngineer;
    final int blockchainDeveloper;
    final int businessDeveloper;
    final int cCDeveloper;
    final int chatbotDeveloper;
    final int cloudArchitect;
    final int cloudDataEngineer;
    final int cloudDeveloper;
    final int cloudEngineer;
    final int cmsDeveloper;
    final int cmsManager;
    final int cobolDeveloper;
    final int communityManager;
    final int computerScience;
    final int coordinadorAcademico;
    final int coordinadorBaseDeDatos;
    final int coordinadorServiceDesk;
    final int dataArchitect;
    final int dataEngineer;
    final int dataEngineerDeveloper;
    final int dataScientist;
    final int developer;
    final int developerManager;
    final int devopsDeveloper;
    final int devopsEngineer;
    final int embeddedDeveloper;
    final int enterpriseArchitecture;
    final int especialistaBi;
    final int especialistaCiberseguridad;
    final int especialistaEcm;
    final int especialistaEcommerce;
    final int especialistaErp;
    final int especialistaGestionDeInformacion;
    final int especialistaIa;
    final int especialistaRedesYComunicaciones;
    final int especialistaTi;
    final int especialistaTransformacinDigital;
    final int flutterDeveloper;
    final int frontendAndroid;
    final int frontendDeveloper;
    final int fullstackDeveloper;
    final String categoria;
    final int gamesDeveloper;
    final int genexusDeveloper;
    final int gerenteDeTi;
    final int gestorDeProyectos;
    final int gestorServiceDesk;
    final int iosDeveloper;
    final int iotDeveloper;
    final int javaDeveloper;
    final int javascriptDeveloper;
    final int jefeAutomatizacionRpa;
    final int jefeDeServiciosTi;
    final int jefeInfraestructuraTi;
    final int jefeSoporteTecnico;
    final int machineLearningDeveloper;
    final int microservicesArchitect;
    final int microservicesDeveloper;
    final int mobileDeveloper;
    final int nodeJsDeveloper;
    final int perlDeveloper;
    final int phpDeveloper;
    final int practicanteTi;
    final int processManager;
    final int productManager;
    final int pythonDeveloper;
    final int qaDeveloper;
    final int qaManager;
    final int reactDeveloper;
    final int researchExpert;
    final int rpaDeveloper;
    final int rubyDeveloper;
    final int salesTiEngineer;
    final int scalaDeveloper;
    final int searchEngineExpert;
    final int securityEngineer;
    final int softwareDesign;
    final int softwareEngineer;
    final int soporteTecnico;
    final int sqlDeveloper;
    final int systemEngineer;
    final int systemsAdministrator;
    final int webDeveloper;
    final int webServicesDeveloper;
    final int webscrapingDeveloper;

    factory CatDetails.fromJson(Map<String, dynamic> parsedJson){
        return  CatDetails(
          parsedJson[".NET DEVELOPER"],
          parsedJson["ADMINISTRADOR BASE DE DATOS"],
          parsedJson["ADMINISTRADOR REDES Y COMUNICACIONES"],
          parsedJson["ANALISTA BASE DE DATOS"],
          parsedJson["ANALISTA BI"],
          parsedJson["ANALISTA BIGDATA"],
          parsedJson["ANALISTA BPM"],
          parsedJson["ANALISTA CLOUD"],
          parsedJson["ANALISTA CRM"],
          parsedJson["ANALISTA DATAWAREHOUSE"],
          parsedJson["ANALISTA DE CAPACITACION"],
          parsedJson["ANALISTA DE INTEGRACION"],
          parsedJson["ANALISTA DE PROCESOS"],
          parsedJson["ANALISTA DE RIESGOS"],
          parsedJson["ANALISTA DE SERVICIOS TI"],
          parsedJson["ANALISTA DE SISTEMAS"],
          parsedJson["ANALISTA FORENSE INFORMATICO"],
          parsedJson["ANALISTA FUNCIONAL"],
          parsedJson["ANALISTA GESTION DE INFORMACION"],
          parsedJson["ANALISTA INFRAESTRUCTURA TI"],
          parsedJson["ANALISTA PROGRAMADOR"],
          parsedJson["ANALISTA PROGRAMADOR BI"],
          parsedJson["ANALISTA PROGRAMADOR POWER BUILDER"],
          parsedJson["ANALISTA PROGRAMADOR WEB"],
          parsedJson["ANALISTA QA"],
          parsedJson["ANALISTA REDES Y COMUNICACIONES"],
          parsedJson["ANALISTA SEGURIDAD INFORMATICA"],
          parsedJson["ANALISTA SERVICE DESK"],
          parsedJson["ANALISTA TI"],
          parsedJson["ANDROID DEVELOPER"],
          parsedJson["ANGULAR DEVELOPER"],
          parsedJson["ARQUITECTO ANDROID"],
          parsedJson["ARQUITECTO DE SOFTWARE"],
          parsedJson["AUDITOR DE SISTEMAS"],
          parsedJson["BACKEND AWS DEVELOPER"],
          parsedJson["BACKEND DEVELOPER"],
          parsedJson["BACKEND JAVA DEVELOPER"],
          parsedJson["BACKEND MOBILE DEVELOPER"],
          parsedJson["BACKEND NODE.JS"],
          parsedJson["BACKEND PHP"],
          parsedJson["BACKEND PYTHON"],
          parsedJson["BI DEVELOPER"],
          parsedJson["BI MANAGER"],
          parsedJson["BIGDATA DEVELOPER"],
          parsedJson["BIGDATA ENGINEER"],
          parsedJson["BLOCKCHAIN DEVELOPER"],
          parsedJson["BUSINESS DEVELOPER"],
          parsedJson["C/C++ DEVELOPER"],
          parsedJson["CHATBOT DEVELOPER"],
          parsedJson["CLOUD ARCHITECT"],
          parsedJson["CLOUD DATA ENGINEER"],
          parsedJson["CLOUD DEVELOPER"],
          parsedJson["CLOUD ENGINEER"],
          parsedJson["CMS DEVELOPER"],
          parsedJson["CMS MANAGER"],
          parsedJson["COBOL DEVELOPER"],
          parsedJson["COMMUNITY MANAGER"],
          parsedJson["COMPUTER SCIENCE"],
          parsedJson["COORDINADOR ACADEMICO"],
          parsedJson["COORDINADOR BASE DE DATOS"],
          parsedJson["COORDINADOR SERVICE DESK"],
          parsedJson["DATA ARCHITECT"],
          parsedJson["DATA ENGINEER"],
          parsedJson["DATA ENGINEER & DEVELOPER"],
          parsedJson["DATA SCIENTIST"],
          parsedJson["DEVELOPER"],
          parsedJson["DEVELOPER MANAGER"],
          parsedJson["DEVOPS DEVELOPER"],
          parsedJson["DEVOPS ENGINEER"],
          parsedJson["EMBEDDED DEVELOPER"],
          parsedJson["ENTERPRISE ARCHITECTURE"],
          parsedJson["ESPECIALISTA BI"],
          parsedJson["ESPECIALISTA CIBERSEGURIDAD"],
          parsedJson["ESPECIALISTA ECM"],
          parsedJson["ESPECIALISTA ECOMMERCE"],
          parsedJson["ESPECIALISTA ERP"],
          parsedJson["ESPECIALISTA GESTION DE INFORMACION"],
          parsedJson["ESPECIALISTA IA"],
          parsedJson["ESPECIALISTA REDES Y COMUNICACIONES"],
          parsedJson["ESPECIALISTA TI"],
          parsedJson["ESPECIALISTA TRANSFORMACIÓN DIGITAL"],
          parsedJson["FLUTTER DEVELOPER"],
          parsedJson["FRONTEND ANDROID"],
          parsedJson["FRONTEND DEVELOPER"],
          parsedJson["FULLSTACK DEVELOPER"],
          parsedJson["CATEGORIA"].toString(),
          parsedJson["GAMES DEVELOPER"],
          parsedJson["GENEXUS DEVELOPER"],
          parsedJson["GERENTE DE TI"],
          parsedJson["GESTOR DE PROYECTOS"],
          parsedJson["GESTOR SERVICE DESK"],
          parsedJson["IOS DEVELOPER"],
          parsedJson["IOT DEVELOPER"],
          parsedJson["JAVA DEVELOPER"],
          parsedJson["JAVASCRIPT DEVELOPER"],
          parsedJson["JEFE AUTOMATIZACION RPA"],
          parsedJson["JEFE DE SERVICIOS TI"],
          parsedJson["JEFE INFRAESTRUCTURA TI"],
          parsedJson["JEFE SOPORTE TECNICO"],
          parsedJson["MACHINE LEARNING DEVELOPER"],
          parsedJson["MICROSERVICES ARCHITECT"],
          parsedJson["MICROSERVICES DEVELOPER"],
          parsedJson["MOBILE DEVELOPER"],
          parsedJson["NODE.JS DEVELOPER"],
          parsedJson["PERL DEVELOPER"],
          parsedJson["PHP DEVELOPER"],
          parsedJson["PRACTICANTE TI"],
          parsedJson["PROCESS MANAGER"],
        parsedJson["PRODUCT MANAGER"],
        parsedJson["PYTHON DEVELOPER"],
        parsedJson["QA DEVELOPER"],
        parsedJson["QA MANAGER"],
        parsedJson["REACT DEVELOPER"],
        parsedJson["RESEARCH EXPERT"],
        parsedJson["RPA DEVELOPER"],
        parsedJson["RUBY DEVELOPER"],
        parsedJson["SALES TI ENGINEER"],
        parsedJson["SCALA DEVELOPER"],
        parsedJson["SEARCH ENGINE EXPERT"],
        parsedJson["SECURITY ENGINEER"],
        parsedJson["SOFTWARE DESIGN"],
        parsedJson["SOFTWARE ENGINEER"],
        parsedJson["SOPORTE TECNICO"],
        parsedJson["SQL DEVELOPER"],
        parsedJson["SYSTEM ENGINEER"],
        parsedJson["SYSTEMS ADMINISTRATOR"],
        parsedJson["WEB DEVELOPER"],
        parsedJson["WEB SERVICES DEVELOPER"],
        parsedJson["WEBSCRAPING DEVELOPER"],
    );

    } 

    
}
