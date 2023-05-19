import 'package:logger/logger.dart';
import 'package:pulse/pulse.dart';
import 'package:rand_users/model/user_model.dart';
import 'package:rand_users/service/i_user_service.dart';

class UsersViewModel extends PulseListViewModel<UserModel> {
  final IUserService service;
  UsersViewModel({
    required this.service,
  });

  void addUser() {
    UserModel user = service.getNewUser();
    addValue(user);
  }
}
