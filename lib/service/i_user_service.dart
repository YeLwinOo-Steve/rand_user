import 'package:rand_users/model/user_model.dart';

abstract class IUserService{
  UserModel getNewUser();
}