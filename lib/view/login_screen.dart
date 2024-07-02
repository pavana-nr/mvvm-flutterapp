import 'package:flutter/material.dart';

import '../res/components/round_button.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Login Screen'),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.home);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context, emailFocusNode, passwordFocusNode);
                    },
                  ),
                  const SizedBox(height: 10),
                  ValueListenableBuilder(
                      valueListenable: _obscurePassword,
                      builder: (context, value, child) {
                        return TextFormField(
                          obscureText: _obscurePassword.value,
                          obscuringCharacter: '*',
                          controller: _passwordController,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Password',
                              hintText: 'Password',
                              prefixIcon: const Icon(Icons.lock_open_rounded),
                              suffixIcon: InkWell(
                                  onTap: () {
                                    _obscurePassword.value =
                                        !_obscurePassword.value;
                                  },
                                  child: _obscurePassword.value
                                      ? const Icon(
                                          Icons.visibility_off_outlined)
                                      : const Icon(Icons.visibility))),
                          onFieldSubmitted: (value) {},
                        );
                      }),
                  SizedBox(height: height * .1),
                  RoundButton(
                      title: "Login",
                      onPress: () {
                        Login();
                      })
                ],
              ),
            ),
          )),
    );
  }

  void Login() {}
}
