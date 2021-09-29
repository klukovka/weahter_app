import 'package:flutter/material.dart';
import 'package:weather_app/src/resources/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageChooser extends StatelessWidget {
  const LanguageChooser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          '${LocaleKeys.language.tr()}: ${LocaleKeys.currentLanguage.tr()}',
          style: textTheme.headline3,
        ),
        _languageButton(context, 'en', LocaleKeys.english.tr()),
        _languageButton(context, 'ru', LocaleKeys.russian.tr()),
      ],
    );
  }

  Widget _languageButton(
    BuildContext context,
    String locale,
    String tr,
  ) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              onPressed: () async {
                await context.setLocale(Locale(locale));
              },
              child: Text(tr)),
        ),
      ],
    );
  }
}
