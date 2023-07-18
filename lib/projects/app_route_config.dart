

import '../pages/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/registration.dart';
import '../pages/error_page.dart';
import 'app_route_constans.dart';



class MyRouter{
  GoRouter router = GoRouter(
      routes:[
        GoRoute(
            path:'/',
             name: MyRouterConstants.homeRouteName,
              pageBuilder: (context,state){
              return MaterialPage(
                  child:Home());
        },),
        GoRoute(
          path:'/registration',
          name:  MyRouterConstants.registerRouteName,
          pageBuilder: (context,state){
            return MaterialPage(
                child:Registration());
          },)
      ],
    errorPageBuilder: (context,state){
        return MaterialPage(child:Error());
    },
      
  );

}