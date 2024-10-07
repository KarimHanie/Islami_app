import 'package:flutter/material.dart';

class Radio_tab extends StatefulWidget{
  @override
  State<Radio_tab> createState() => _Radio_tabState();
}

class _Radio_tabState extends State<Radio_tab> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/551-5517026_radio-vector-png-old-radio-png-vector-transparent.png'),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'إذاعة القرآن الكريم',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Icon(Icons.skip_previous ),
                Icon(Icons.play_arrow,size: 50,),
                Icon(Icons.skip_next),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}