import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/model/GifResponse.dart';

class GifItem extends StatelessWidget {
  final Data gif;

  GifItem({required this.gif});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Image.network(
        gif.images!.downsized!.url.toString(),
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if(loadingProgress == null) {
            return child;
          } else {
            return Center(
              // child: Image.asset('assets/images/placeholder_image.gif',
              // fit: BoxFit.cover
              child: CircularProgressIndicator()
            );
          }
        },
        errorBuilder: (context, error, stackTrace) {
          print(error);
          return Center(
            child: Icon(Icons.error),
          );
        },
      ),
    );
  }

}