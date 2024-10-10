import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/tabs/LoadingScreen/loading_indecator.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';

import 'hadeth_content.dart';

class Hadeth extends StatefulWidget {
  @override
  State<Hadeth> createState() => _HadethState();
}

class _HadethState extends State<Hadeth> {
  List<HadethArgs> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) {
      loadAhadethFile();
    }
    // TODO: implement build
    return Scaffold(
        body: (ahadeth.isNotEmpty)?Column(
      children: [
        Image.asset(
          'assets/images/hadeth_logo.png',
          height: MediaQuery.sizeOf(context).height * 0.28,
        ),
        Divider(color: Theme.of(context).primaryColor,thickness:3,),
        Align(child: Text('الأحاديث',style: Theme.of(context).textTheme.headlineSmall,),),
        Divider(color: Theme.of(context).primaryColor,thickness:3,),
        Expanded(
            child: ListView.separated(
          itemBuilder: (_, index) => GestureDetector(
            onTap: () => Navigator.of(context)
                .pushNamed(HadethContent.routeName, arguments: ahadeth[index]),
            child: Text(
              '${ahadeth[index].title}',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),
          itemCount: ahadeth.length,
          separatorBuilder: (_, __) => SizedBox(height: 12),
        )),
      ],
    ):LoadingIndecator()

    );
  }

  Future<void> loadAhadethFile() async {
    // rootBundle used to deal with assets
    String ahadethFileContent =
        await rootBundle.loadString('assets/text/ahadeth.txt');
    List<String> hadethString = ahadethFileContent.split('#');
    ahadeth = hadethString.map((hadethString) {
      List<String> hadethLines = hadethString.trim().split('\n');
      String title = hadethLines.first;
      hadethLines.removeAt(0);
      List<String> content = hadethLines;
      return HadethArgs(title: title, content: content);
    }).toList();
    setState(() {});
  }
}
