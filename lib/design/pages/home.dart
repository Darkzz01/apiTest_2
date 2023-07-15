import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const FaIcon(
                FontAwesomeIcons.dollarSign,
                size: 30,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              const Text(
                'Icon: DollarSign',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const FaIcon(
                FontAwesomeIcons.lock,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              const Text(
                'Icon: Lock',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Icon(
                Icons.currency_exchange,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              const Text(
                'Icon: Currency_exchange',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const FaIcon(
                FontAwesomeIcons.m,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              const Text(
                'Icon: m',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Icon(
                Icons.cable_sharp,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              const Text(
                'Icon: Cable_sharp',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const FaIcon(
                FontAwesomeIcons.a,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              const Text(
                'Icon: a',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              TextButton(
                onPressed: () {
                  context.pushNamed('/users');
                },
                child: const Text(
                  'Test',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.lightGreenAccent,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
