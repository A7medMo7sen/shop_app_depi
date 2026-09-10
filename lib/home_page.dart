import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color _blue = const Color.fromRGBO(2, 33, 170, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: const Text(
          'Product Catalog',
          style: TextStyle(fontWeight: FontWeight(700)),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          Container(
            decoration: BoxDecoration(
              color: _blue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person_outlined, color: Colors.white),
            ),
          ),
        ],
      ),

    );
  }
}
