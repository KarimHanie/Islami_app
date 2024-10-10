import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';

import '../../app_theme.dart';
import '../LoadingScreen/loading_indecator.dart';

class HadethContent extends StatefulWidget {
  static const String routeName = '/hadethContent';

  @override
  State<HadethContent> createState() => _HadethContentState();
}

class _HadethContentState extends State<HadethContent> {
  @override
  Widget build(BuildContext context) {
    HadethArgs args =ModalRoute.of(context)!.settings.arguments as HadethArgs;

    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/default_bg.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('${args.title}'),
        ),
        body: Container(
                padding: EdgeInsets.all(25),
                margin: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: MediaQuery.sizeOf(context).height * 0.07),
                decoration: BoxDecoration(
                  color: AppTheme.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ListView.builder(
                  itemBuilder: (_, index) => Container(
                    child: Text(args.content[index],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  itemCount: args.content.length,
                ),
              )
      ),
    );
  }
}
