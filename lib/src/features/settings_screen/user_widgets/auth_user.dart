import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/resources/strings.dart';
import 'package:weather_app/src/resources/theme/app_text_theme.dart';
import 'package:weather_app/src/resources/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class AuthUser extends StatelessWidget {
  const AuthUser(this.user, this.onPressed, {Key? key}) : super(key: key);
  final User user;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final photo = user.photoURL ??
        photoUrl;
    return ListTile(
      title: Text(user.displayName ?? LocaleKeys.user.tr(),
          style: AppTextTheme.headline3),
      subtitle: Text(user.email ?? LocaleKeys.email.tr(),
          style: AppTextTheme.headline3),
      leading: CircleAvatar(
        radius: 30.0,
        backgroundImage: NetworkImage(photo.replaceFirst('s96', 's400')),
      ),
      trailing: ElevatedButton(
        onPressed: onPressed,
        child: Text(LocaleKeys.logOut.tr()),
      ),
    );
  }
}
