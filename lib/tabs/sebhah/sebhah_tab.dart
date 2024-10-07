import 'dart:math';

import 'package:flutter/material.dart';

class Sebhah extends StatefulWidget {
  @override
  State<Sebhah> createState() => _SebhahState();
}

class _SebhahState extends State<Sebhah> {
  int counter=0,result=0,i=0;
  double _angle = 0.0; // Initial angle

  List<String> tsbehat=['سبحان الله','الحمد الله','الله أكبر'];

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Image.asset('assets/images/head_sebha_logo.png'),
                  GestureDetector(
                      onTap: () => {
                        increaseNumber()
                      },
                      child: Transform.rotate(
                          angle: _angle,
                          child: Image.asset('assets/images/body of seb7a.png'))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'عدد التسبيحات',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontSize: 30),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.sizeOf(context).height * 0.03),
                  height: MediaQuery.sizeOf(context).height * 0.109,
                  width: MediaQuery.sizeOf(context).width * 0.20,
                  decoration: BoxDecoration(
                      color: Color(0xffc3c2a17a),
                      borderRadius: BorderRadius.circular(25)),
                  child: Align(
                      alignment: Alignment.center,
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text('$result',
                              style: Theme.of(context).textTheme.titleLarge))),
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.08,
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Align(
                      alignment: Alignment.center,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text('${tsbehat[i]}',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(color:Colors.white)),
                      )),
                ),git
              ],
            )
          ],
        ),
      ),
    );
  }

  void increaseNumber(){
    counter++;
    result++;
    if(33==counter){
      counter=0;
      i++;
      if(i==3){
        i=0;
      }
    }
    _angle += pi / 2; // Rotate 90 degrees

    setState(() {});

  }
}
