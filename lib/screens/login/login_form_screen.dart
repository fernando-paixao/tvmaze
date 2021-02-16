import 'package:flutter/material.dart';
import 'package:jobsityChallenge/components/loading.dart';
import 'package:jobsityChallenge/repository/biometric_login_repository.dart';
import 'package:jobsityChallenge/repository/pin_repository.dart';
import 'package:jobsityChallenge/screens/favorites/favorite_screen.dart';
import 'package:jobsityChallenge/screens/people/people_list_screen.dart';
import 'package:jobsityChallenge/screens/show/show_list_screen.dart';
import 'package:local_auth/local_auth.dart';

import '../home_screen.dart';

class LoginFormScreen extends StatefulWidget {
  @override
  _LoginFormScreenState createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  bool isLoaded;
  bool isActiveBiometricLogin;
  bool activateBiometricLogin;
  bool canUseBiometricLogin;
  String pinToMatch;
  final _passwordController = TextEditingController();

  _load() async {
    String storedPin = await PinRepository().getPin();
    bool storedBiometricLogin =
        await BiometricLoginRepository().getIsActive() ?? false;

    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await LocalAuthentication().canCheckBiometrics;
    } catch (e) {
      canCheckBiometrics = true;
      print(e);
    }

    if (canCheckBiometrics && storedBiometricLogin) _showBiometricLogin();

    setState(() {
      isLoaded = true;
      activateBiometricLogin = false;
      pinToMatch = storedPin;
      isActiveBiometricLogin = storedBiometricLogin;
      canUseBiometricLogin = canCheckBiometrics;
    });
  }

  _showBiometricLogin() async {
    bool didAuthenticate = false;
    try {
      didAuthenticate = await LocalAuthentication().authenticateWithBiometrics(
          localizedReason: 'Try to login using your biometry');
      if (didAuthenticate) {
        _login();
      }
    } catch (e) {
      print(e);
    }
    if (didAuthenticate == null || didAuthenticate == false) {
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text("Biometric check failed, please try again")));
    }
  }

  _login() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HomeScreen([
                ShowListScreen(),
                PeopleListScreen(),
                FavoriteScreen(),
              ])),
    );
  }

  _verify() async {
    if ((pinToMatch == null || pinToMatch.isEmpty)) {
      await PinRepository().setPin(_passwordController.text);
      if (activateBiometricLogin)
        await BiometricLoginRepository().setIsActive(activateBiometricLogin);
      _login();
    } else if (_passwordController.text == pinToMatch) {
      if (activateBiometricLogin)
        await BiometricLoginRepository().setIsActive(activateBiometricLogin);
      _login();
    } else
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text("Wrong Password, please try again")));
  }

  @override
  void initState() {
    isLoaded = false;
    _load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !isLoaded
        ? Loading()
        : Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Column(
              children: [
                TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        icon: Padding(
                          padding: EdgeInsets.only(top: 24.0),
                          child: Icon(
                            Icons.lock,
                            size: 32.0,
                          ),
                        ),
                        hintText: 'Type your PIN password',
                        labelText: 'Password')),
                if (canUseBiometricLogin && isActiveBiometricLogin)
                  Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: RaisedButton(
                          child: Text("Biometric Login"),
                          onPressed: () => _showBiometricLogin()))
                else if (canUseBiometricLogin && !isActiveBiometricLogin)
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Activate Biometric Login"),
                          Switch(
                              value: activateBiometricLogin,
                              onChanged: (value) => setState(
                                  () => activateBiometricLogin = value),
                              activeTrackColor: Colors.lightBlueAccent,
                              activeColor: Colors.blue),
                        ]),
                  ),
                Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: RaisedButton(
                        child: (pinToMatch == null || pinToMatch.isEmpty)
                            ? Text("Register")
                            : Text("Login"),
                        onPressed: () => _verify()))
              ],
            ),
          );
  }
}
