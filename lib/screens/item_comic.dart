import 'package:consumo_api_app/models/comics_response.dart';
import 'package:flutter/material.dart';

class ItemComic extends StatelessWidget {
  const ItemComic({
    Key? key,
    required this.colors,
    required this.comic,
  }) : super(key: key);

  final List<Color> colors;
  final Comic comic;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'detail', arguments: comic);
      },
      child: Container(
        child: Image(
          fit: BoxFit.cover,
          image: NetworkImage(
            comic.getFullPoster(),
          ),
        ),
      ),
    );
  }
}
