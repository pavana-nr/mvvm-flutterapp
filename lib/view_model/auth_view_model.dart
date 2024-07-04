import 'package:flutter/material.dart';
import 'package:mvvmexample/repository/auth_repo.dart';

import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _setsignupLoading = false;
  bool get setsignupLoading => _setsignupLoading;

  setsignupLoadingFun(bool value) {
    _setsignupLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo
        .loginApi(data)
        .then((value) => {
              setLoading(false),
              print(value),
              if (value['token'] != null)
                {Navigator.pushNamed(context, RoutesName.home)}
            })
        .catchError((e) =>
            {setLoading(false), Utils.toastMessage(e.toString()), print(e)});
  }

  Future<void> signupApi(dynamic data, BuildContext context) async {
    setsignupLoadingFun(true);
    _myRepo
        .signupApi(data)
        .then((value) => {
              setsignupLoadingFun(false),
              print(value),
              if (value['token'] != null)
                {Navigator.pushNamed(context, RoutesName.home)}
            })
        .catchError((e) => {
              setsignupLoadingFun(false),
              Utils.toastMessage(e.toString()),
              print(e)
            });
  }
}
