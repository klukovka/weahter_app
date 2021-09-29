import 'package:flutter/material.dart';
import 'package:weather_app/src/resources/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class NonauthUser extends StatelessWidget {
  const NonauthUser(this.onPressed, {Key? key}) : super(key: key);
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        LocaleKeys.singIn.tr(),
      ),
    );
  }
}
