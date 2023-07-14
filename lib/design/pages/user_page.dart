import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/api/api.dart';
import '../../data/model/user.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final api = Api();
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Page'),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: FutureBuilder(
          future: api.getUser(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.purpleAccent,
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Error',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            } else if (snapshot.hasData) {
              return listOfUsers(snapshot.data);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget listOfUsers(List<User> users) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: users.length,
      separatorBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            height: 0,
            color: Colors.white10,
          ),
        );
      },
      itemBuilder: (context, index) {
        return userItem(context, users, index);
      },
    );
  }

  Widget userItem(BuildContext context, List<User> users, int index) {
    return GestureDetector(
      onTap: () {
        context.pushNamed('/details',
            pathParameters: {'id': '${users[index].id}'});
      },
      child: Container(
        height: 90,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.05),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            const CircleAvatar(
              minRadius: 30,
              backgroundColor: Colors.black12,
              child: Icon(
                Icons.person_rounded,
                size: 30,
                color: Colors.white24,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  users[index].name,
                  style: const TextStyle(
                    fontSize: 21,
                  ),
                ),
                Text(
                  users[index].email,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 20,
              color: Colors.white24,
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
