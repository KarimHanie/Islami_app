import 'package:flutter/material.dart';
import 'package:islami/home_screen.dart';

void main(){
  runApp(IslamiApp());
}
class IslamiApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}