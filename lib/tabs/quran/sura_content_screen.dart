import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/quran.dart';

class SuraContent extends StatelessWidget {
  static const String routeName = '/suraContent';
  List<String> ayat = [
    "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ",
    'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
    'الرَّحْمَنِ الرَّحِيمِ',
    'مَالِكِ يَوْمِ الدِّينِ',
    'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِين',
    'اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ',
    ' صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّين',
  ];
  late SuraArgs args;
  @override
  Widget build(BuildContext context) {
     args=ModalRoute.of(context)!.settings.arguments as SuraArgs;
     loadSuraFile();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/default_bg.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('${args.suraNAme}'),
        ),
        body: Container(
            padding: EdgeInsets.all(25),
          margin: EdgeInsets.symmetric(horizontal:24 ,vertical: MediaQuery.sizeOf(context).height*0.07),
          decoration: BoxDecoration(
            color: AppTheme.white.withOpacity(0.85),
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
        ),
      ),
    );
  }
  void loadSuraFile (){
    print(args.suraNAme);
    print(args.index);

}
}
