import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/tabs/hadeth/hadeth_content.dart';
import 'package:islami/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/tabs/quran/sura_content_screen.dart';
import 'package:islami/tabs/settings/setting_tab.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main(){
  runApp(ChangeNotifierProvider(create:(context) =>SettingsProvider()  ,child: IslamiApp(),));
}
class IslamiApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // the way to access the changenotifierProvider i created above
    SettingsProvider settingsProvider=Provider.of<SettingsProvider>(context);
    // TODO: implement build
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.dartTheme,
      themeMode:settingsProvider.themeMode,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),
        SuraContent.routeName:(_)=>SuraContent(),
        HadethContent.routeName:(_)=>HadethContent(),
        Setting.routName:(_)=>Setting()

      },
      initialRoute: HomeScreen.routeName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.languageCode) ,
    );
  }
}