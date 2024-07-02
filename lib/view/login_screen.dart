import 'package:flutter/material.dart';

import '../utils/routes_name.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesName.home);
      },
      child: const Center(child: Text('Login Screen')),
    ));
  }
}
