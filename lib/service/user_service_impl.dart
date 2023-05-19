import 'package:faker/faker.dart';
import 'package:rand_users/model/user_model.dart';
import 'package:rand_users/service/i_user_service.dart';

class UserServiceImpl extends IUserService {
  final faker = Faker();
  @override
  UserModel getNewUser() {
    String city = faker.address.city();
    String name = faker.person.name();
    DateTime birthDate =
        faker.date.dateTimeBetween(DateTime(1940), DateTime.now());
    int age = DateTime.now().year - birthDate.year;
    String job = faker.job.title();
    return UserModel(
      name: name,
      age: age.toString(),
      job: job,
      city: city,
    );
  }
}
