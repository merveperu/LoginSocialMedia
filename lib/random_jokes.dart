//This is the page where it creates jokes with api.

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class random_jokes extends StatefulWidget {
  const random_jokes({super.key});

  @override
  State<random_jokes> createState() => _random_jokesState();
}

class _random_jokesState extends State<random_jokes> {
  
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    fetchJokes();
  }
  Future<void> fetchJokes() async {
    final response =
        await http.get(Uri.parse("http://www.boredapi.com/api/activity/"));
    print("joke function çalıştı");
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
        print(response.statusCode);
      });
    } else {
      throw Exception('Failed to load data');
      print("response code:"+response.statusCode.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
