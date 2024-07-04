import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    final height = MediaQuery.of(context).size.height * 1;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Signup Screen'),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: Padding(
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
                                    ? const Icon(Icons.visibility_off_outlined)
                                    : const Icon(Icons.visibility))),
                        onFieldSubmitted: (value) {},
                      );
                    }),
                SizedBox(height: height * .1),
                RoundButton(
                    title: "Sign Up",
                    loading: authViewModel.setsignupLoading,
                    onPress: () {
                      if (_emailController.text.isEmpty) {
                        Utils.toastMessage("Please enter email");
                      } else if (_passwordController.text.isEmpty) {
                        Utils.toastMessage("Please enter password");
                      } else if (_passwordController.text.length < 6) {
                        Utils.toastMessage(
                            "Password length should be atleast 6 characters.");
                      } else {
                        Map data = {
                          'email': _emailController.text.toString(),
                          'password': _passwordController.text.toString(),
                        };
                        authViewModel.signupApi(data, context);
                      }
                    }),
                SizedBox(
                  height: height * .2,
                ),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.login);
                    },
                    child: const Text("Already have an account? Sign in")),
              ],
            ),
          )),
    );
  }
}
