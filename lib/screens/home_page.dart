import 'package:consumo_api_app/api/comics_api.dart';
import 'package:consumo_api_app/models/comics_response.dart';
import 'package:consumo_api_app/screens/item_comic.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<Color> colors = [
      Colors.redAccent,
      Colors.teal,
      Colors.green,
      Colors.grey,
      Colors.purple,
      Colors.yellow,
      Colors.indigo
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text('Movies page'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.change_circle))
          ],
        ),
        body: FutureBuilder<List<Comic>>(
          future: apiComics(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }

            if (snapshot.hasData) {
              return Container(
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      'Mis comics',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: GridView.builder(
                        itemCount: snapshot.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          mainAxisExtent: 200,
                        ),
                        itemBuilder: (context, index) {
                          final comic = snapshot.data![index];
                          return ItemComic(colors: colors, comic: comic);
                        },
                      ),
                    )
                  ],
                ),
              );
            }

            return SizedBox();
          },
        ));
  }
}
