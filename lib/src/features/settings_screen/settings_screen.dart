import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/features/home_page/widgets/weather_app_error.dart';
import 'package:weather_app/src/features/home_page/widgets/weather_app_loader.dart';
import 'package:weather_app/src/features/settings_screen/google_sign_in_provider.dart';
import 'package:weather_app/src/features/settings_screen/user_widgets/auth_user.dart';
import 'package:weather_app/src/features/settings_screen/user_widgets/nonauth_user.dart';
import 'package:weather_app/src/features/settings_screen/widgets/language_chooser.dart';
import 'package:weather_app/src/resources/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.settings.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                LocaleKeys.user.tr(),
                textAlign: TextAlign.center,
                style: textTheme.headline3,
              ),
            ),
            StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const WeatherAppLoader();
                  } else if (snapshot.hasError) {
                    return WeatherAppError(LocaleKeys.wentWrong.tr());
                  } else if (snapshot.hasData) {
                    final user = FirebaseAuth.instance.currentUser;
                    return AuthUser(user!, () {
                      provider.googleLogout();
                    });
                  } else {
                    return NonauthUser(() {
                      provider.googleLogin();
                    });
                  }
                }),
            const Divider(),
            const LanguageChooser(),
          ],
        ),
      ),
    );
  }
}
