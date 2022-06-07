import 'package:aruna_test/feature/aruna_test/model/posts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Posts data = Get.arguments['data'];
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail data"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(data.title),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(data.body),
            ),
          ],
        ));
  }
}
