import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:US24/Controller/new_c.dart';
import 'package:US24/View/widget/AppBar.dart';
import 'package:US24/View/widget/Loading.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final NewController c = Get.put(NewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Obx(() {
        if (c.newsList.isEmpty) {
          return Center(child: Loading());
        } else {
          return ListView.builder(
            itemCount: c.newsList.length,
            itemBuilder: (context, index) {
              final article = c.newsList[index];
              return Card(
                elevation: 10,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (article.urlToImage != null)
                      ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                        child: Image.network(
                          article.urlToImage!,
                          fit: BoxFit.cover,
                        ),
                      )
                    else
                      Container(
                        child: Center(child: Text('loading ...')),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        article.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    if (article.description != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          article.description!,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    SizedBox(height: 8),
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
