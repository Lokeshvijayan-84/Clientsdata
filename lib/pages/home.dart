
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('EEE, MMM d').format(DateTime.now());
    String currentTime = DateFormat('HH:mm').format(DateTime.now());


    return Scaffold(
      appBar: AppBar(
        title: Text('Client details'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body:Container(
        width:double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/first.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top:17),
              child:Column(

                  children:[
                    Image.asset('images/intellecto.png'),
                    //SizedBox(height:26),
                    Text(
                      '${currentTime}',
                      style: TextStyle(fontSize: 50, color: Colors.grey[900]),
                    ),
                    Text(
                      '${currentDate}',
                      style: TextStyle(fontSize: 30, color: Colors.grey[900]),
                    ),

                  ]
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 60),
              child: ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).push(Uri(path:'/registration').toString());
                  //ok running

                  //Navigator.pushNamed(context,'/registration');
                  //Navigator.of(context, rootNavigator: true).pushNamed("/registration");

                },
                child: Text('Register'),
                style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,

                ),

              ),

            ),
          ],
        ),
      ),
    );



  }
}


