// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:api_test_2/data/api/api.dart';
import 'package:api_test_2/data/model/todo.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  List<ToDo> todo = [];
  @override
  void initState() {
    super.initState();
    fetchToDo();
  }

  Future<void> fetchToDo() async {
    final api = Api();
    final fetchedToDos = await api.getToDo(widget.id);
    List<ToDo> filtrados = [];

    for (var element in fetchedToDos) {
      if (element.userId == widget.id) {
        filtrados.add(element);
      }
    }
    setState(() {
      todo = filtrados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details Page'),
      ),
      body: Container(
          child: ListView.builder(
        itemCount: todo.length,
        itemBuilder: (context, index) {
          final todos = todo[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color.fromARGB(24, 158, 158, 158),
                ),
                child: const Icon(
                  Icons.person_rounded,
                  size: 40,
                  color: Colors.white60,
                ),
              ),
              subtitle: Column(
                children: [
                  Text(
                    'Title: ${todos.title.toString()}',
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white60,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${todos.completed}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
