import 'package:flutter/material.dart';
import 'package:weather_app/src/resources/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageChooser extends StatelessWidget {
  const LanguageChooser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${LocaleKeys.language.tr()}: ${LocaleKeys.currentLanguage.tr()}'),
        ElevatedButton(
            onPressed: () async {
              await context.setLocale(Locale('en'));
            },
            child: Text(LocaleKeys.english.tr())),
        ElevatedButton(
            onPressed: () async {
              await context.setLocale(const Locale('ru'));
            },
            child: Text(LocaleKeys.russian.tr())),
      ],
    );
  }
}
