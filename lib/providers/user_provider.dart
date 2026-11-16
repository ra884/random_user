import 'package:flutter/material.dart';
import 'package:random_user_app/models/user_model.dart';
import 'package:random_user_app/services/user_service.dart';

class UserProvider extends ChangeNotifier {
  Users? usersObject;
  Future<void> requestUsers() async {
    usersObject = await UserService.getUsers();
    notifyListeners();
  }
}
