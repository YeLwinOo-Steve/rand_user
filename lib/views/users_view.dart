import 'package:flutter/material.dart';
import 'package:pulse/pulse.dart';
import 'package:rand_users/model/user_model.dart';
import 'package:rand_users/service/user_service_impl.dart';
import 'package:rand_users/view_models/users_view_model.dart';

class UsersView extends StatelessWidget {
  UsersView({Key? key}) : super(key: key);
  final viewModel = UsersViewModel(service: UserServiceImpl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: PulseBuilder(
        viewModel: viewModel,
        builder: (context, model, _) {
          return model.value.isEmpty
              ? const Center(
                  child: Text('No users created!'),
                )
              : GridView.builder(
                  padding: const EdgeInsets.only(bottom: 80),
                  addAutomaticKeepAlives: true,
                  addRepaintBoundaries: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: model.value.length,
                  itemBuilder: (context, index) {
                    UserModel user = model.value[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.amber.shade200,
                      ),
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            user.name,
                            maxLines: 8,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '${user.age} years',
                          ),
                          Text(
                            user.job,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            user.city,
                          ),
                        ],
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.addUser,
        child: const Icon(Icons.person_add_alt_rounded),
      ),
    );
  }
}
