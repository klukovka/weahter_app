import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/features/home_page/widgets/weather_app_error.dart';
import 'package:weather_app/src/features/home_page/widgets/weather_app_loader.dart';
import 'package:weather_app/src/features/settings_screen/google_sign_in_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        child: ListView(
          children: [
            Text('User'),
            StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return WeatherAppLoader();
                  } else if (snapshot.hasError) {
                    return WeatherAppError('Something went wrong');
                  } else if (snapshot.hasData) {
                    final user = FirebaseAuth.instance.currentUser;
                    return Expanded(
                      child: Column(
                        children: [
                          Text('${user!.displayName}'),
                          ElevatedButton(
                              onPressed: () {
                                provider.googleLogout();
                              },
                              child: Text('Log out')),
                        ],
                      ),
                    );
                  } else {
                    return ElevatedButton(
                        onPressed: () {
                          provider.googleLogin();
                        },
                        child: Text("Sign up with Google"));
                  }
                }),
            Divider(),
          ],
        ),
      ),
    );
  }
}
