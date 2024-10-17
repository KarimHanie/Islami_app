import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/LoadingScreen/loading_indecator.dart';
import 'package:islami/tabs/quran/quran.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../settings/settings_provider.dart';

class SuraContent extends StatefulWidget {
  static const String routeName = '/suraContent';

  @override
  State<SuraContent> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> {
  List<String> ayat = [];

  late SuraArgs args;

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider=Provider.of<SettingsProvider>(context);
    args = ModalRoute.of(context)!.settings.arguments as SuraArgs;
    if (ayat.isEmpty) {
      loadSuraFile();
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('${Provider.of<SettingsProvider>(context).backGroundImageName}.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('${args.suraNAme}'),
        ),
        body: (ayat.isNotEmpty)?Container(
          padding: EdgeInsets.all(25),
          margin: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: MediaQuery.sizeOf(context).height * 0.07),
          decoration: BoxDecoration(
            color: settingsProvider.isDark?AppTheme.darkPrimary:AppTheme.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: ListView.builder(
            itemBuilder: (_, index) => Container(
              child: Text(
                ayat[index],
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            itemCount: ayat.length,
          ),
        ):LoadingIndecator(),
      ),
    ) ;
  }

  Future<void> loadSuraFile() async {
    // rootBundle used to deal with assets
    String sura =
        await rootBundle.loadString('assets/text/${args.index + 1}.txt');
    ayat = sura.split('\r\n');
    setState(() {});
  }
}
