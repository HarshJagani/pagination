import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pagination/model.dart';
import 'design.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int page = 1;
  List<Welcome> post = [];

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      scrollListenr();
    });
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView.builder(
          controller: _scrollController,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: DesignContainer(
                data: post[index],
              ),
            );
          },
          itemCount: post.length,
          shrinkWrap: true,
        ));
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://fake-api.sandbox.koodalabs.com/albums?_page=$page&_limit=5'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      setState(() {
        for (Map<String, dynamic> index in data) {
          post.add(Welcome.fromJson(index));
        }
      });
    } else {
      throw Exception('Failed to load album');
    }
  }

  scrollListenr() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      page = page + 1;
      fetchData();
    }
  }
}
