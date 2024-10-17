import 'package:flutter/material.dart';
import 'package:islami/tabs/settings/language.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  static const String routName = '/settings';

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  List<Language> languages = [
    Language(name: 'English', code: 'en'),
    Language(name: 'العربية', code: 'ar')
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark Theme',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w500)),
                Switch(
                    value: settingsProvider.themeMode == ThemeMode.dark,
                    onChanged: (isDark) => settingsProvider.changeTheme(
                        isDark ? ThemeMode.dark : ThemeMode.light)),
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Language',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w500)),
                DropdownButtonHideUnderline(
                  child: DropdownButton<Language>(
                      borderRadius: BorderRadius.circular(20),
                      value: languages.firstWhere((language)=>language.code==settingsProvider.languageCode),
                      items: languages
                          .map((language) => DropdownMenuItem<Language>(
                              value: language, child: Text('${language.name}')))
                          .toList(),
                      onChanged: (selectedLanguage) {
                        if(selectedLanguage!=null){
                          settingsProvider.changeLanguage(selectedLanguage.code);
                        }

                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
