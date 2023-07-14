// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:api_test_2/data/api/api.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    final todo = Api().getToDo;

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details Page'),
      ),
      body: Container(
        child: Column(
          children: [Text('${todo}')],
        ),
      ),
    );
  }
}
