// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:api_test_2/data/model/todo.dart';
import 'package:api_test_2/data/model/user.dart';

class Api {
  Future<List<User>> getUser() async {
    List<User> users = [];

    // Set up URL
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');

    // Make request
    final response = await http.get(url);

    // Extract data with jsonDecode
    final data = await jsonDecode(response.body);

    for (var element in data) {
      final user = userFromJson(jsonEncode(element));
      users.add(user);
    }

    return users;
  }

  Future<List<ToDo>> getToDo(int id) async {
    List<ToDo> todos = [];
    List<ToDo> copyTodos = List.from(todos);

    // Set up URL

    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos');

    // Make request
    final response = await http.get(url);

    // Extract data with jsonDecode
    final data = await jsonDecode(response.body);

    for (var element in data) {
      final todo = toDoFromJson(jsonEncode(element));
      todos.add(todo);
    }

    for (var element in copyTodos) {
      if (element.userId == element.userId) {
        copyTodos.add(element);
      }
    }

    return todos;
  }
}
