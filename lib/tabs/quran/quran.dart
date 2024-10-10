import 'package:flutter/material.dart';
import 'package:islami/tabs/quran/sura_content_screen.dart';

class Quran extends StatelessWidget {
  List<String> suraName = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Image.asset(
          'assets/images/qur2an_screen_logo.png',
          height: MediaQuery.sizeOf(context).height * 0.28,
        ),
        Divider(color: Theme.of(context).primaryColor, thickness: 3),
        IntrinsicHeight(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text('عدد الايات',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Theme.of(context).primaryColor)),
            VerticalDivider(
              color: Theme.of(context).primaryColor,
              thickness: 3,
              width: 0,
            ),
            Text('عدد الايات',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Theme.of(context).primaryColor)),
          ]),
        ),
        Divider(color: Theme.of(context).primaryColor, thickness: 3),
        Expanded(
            child: ListView.separated(
          itemBuilder: (_, index) => GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
              SuraContent.routeName,
              arguments: SuraArgs(suraNAme: suraName[index], index: index),
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      child: Text(
                        suraName[index].length.toString(),
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      )),
                  VerticalDivider(
                    color: Theme.of(context).primaryColor,
                    thickness: 3,
                    width: 0,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    child: Text(
                      suraName[index].trim(),
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          itemCount: suraName.length,
          separatorBuilder: (_, __) => SizedBox(height: 12),
        )),
      ],
    );
  }
}

class SuraArgs {
  String suraNAme;
  int index;

  SuraArgs({required this.suraNAme, required this.index});
}
