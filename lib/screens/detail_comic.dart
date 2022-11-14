import 'package:consumo_api_app/models/comics_response.dart';
import 'package:flutter/material.dart';

class DetailComic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final comicInfo = ModalRoute.of(context)!.settings.arguments as Comic;

    return Scaffold(
      appBar: AppBar(
        title: Text('detalle del comic'),
      ),
      body: Center(
          child: Text(
        comicInfo.title,
        style: TextStyle(fontSize: 30),
      )),
    );
  }
}
