import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/resources/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class AuthUser extends StatelessWidget {
  const AuthUser(this.user, this.onPressed, {Key? key}) : super(key: key);
  final User user;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final photo = user.photoURL ??
        'https://img.freepik.com/free-photo/inspired-caucasian-female-model-with-short-haircut-looking-away-with-shy-smile-on-purple-wall-photo-of-lovable-brown-haired-woman-in-sweater-relaxing-on-photoshoot_197531-7990.jpg?size=626&ext=jpg&ga=GA1.2.1321909448.1614988800';
    return ListTile(
      title: Text(user.displayName ?? LocaleKeys.user.tr()),
      subtitle: Text(user.email ?? LocaleKeys.email.tr()),
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
