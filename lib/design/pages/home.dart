import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            context.pushNamed('/users');
            // Api().getToDo(2);
          },
          child: const Text(
            'Test',
            style: TextStyle(
              fontSize: 20,
              color: Colors.lightGreenAccent,
            ),
          ),
        ),
      ),
    );
  }
}
