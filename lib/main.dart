import 'package:flutter/material.dart';
import 'package:mvvmexample/utils/routes/routes_name.dart';
import 'package:mvvmexample/view/login_screen.dart';
import 'package:mvvmexample/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import 'utils/routes/routes.dart';
import 'view_model/user_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel())
      ],
      child: MaterialApp(
        initialRoute: RoutesName.login,
        onGenerateRoute: Routes.generateRoute,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
