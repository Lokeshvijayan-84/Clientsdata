import "package:clientsdata/projects/app_route_config.dart";
import "package:flutter/material.dart";


void main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routeInformationParser: MyRouter().router.routeInformationParser,
    routerDelegate: MyRouter().router.routerDelegate,



    );
  }
}
