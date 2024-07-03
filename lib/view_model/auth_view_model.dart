import 'package:flutter/material.dart';
import 'package:mvvmexample/repository/auth_repo.dart';

import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    _myRepo
        .loginApi(data)
        .then((value) => {
              print(value),
              if (value['token'] != null)
                {Navigator.pushNamed(context, RoutesName.home)}
            })
        .catchError((e) => {Utils.toastMessage(e.toString()), print(e)});
  }
}
