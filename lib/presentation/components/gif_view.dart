import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/logic/bloc/api/giphy_api_cubit.dart';

import 'gif_item.dart';

class GifView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GifCubit gifCubit = BlocProvider.of<GifCubit>(context);
    return BlocBuilder<GifCubit, GifState>(
      builder: (context, state) {
        if (state is GifInitialState || state is GifLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GifLoadedState) {
          // return GridView.builder(
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
          //   itemCount: state.gifs.length,
          //   itemBuilder: (context, index) {
          //     GifItem(gif: state.gifs[index]);
          //     // Image.network(
          //     //   state.gifs[index].images!.downsized!.url.toString(),
          //     //   fit: BoxFit.cover,
          //     //   loadingBuilder: (context, child, loadingProgress) {
          //     //     if (loadingProgress == null) {
          //     //       return child;
          //     //     } else {
          //     //       return Center(
          //     //           // child: Image.asset('assets/images/placeholder_image.gif',
          //     //           // fit: BoxFit.cover
          //     //           child: CircularProgressIndicator());
          //     //     }
          //     //   },
          //     //   errorBuilder: (context, error, stackTrace) {
          //     //     print(error);
          //     //     return Center(
          //     //       child: Icon(Icons.error),
          //     //     );
          //     //   },
          //     // );
          //     // CachedNetworkImage(
          //     //   imageUrl: "http://via.placeholder.com/350x150",
          //     //   placeholder: (context, url) => CircularProgressIndicator(),
          //     //   errorWidget: (context, url, error) => Icon(Icons.error),
          //     // );
          //   },
          // );
          return ListView.builder(
            itemBuilder: (BuildContext ctx, int index) {
              return GifItem(gif: state.gifs[index]);
            },
            itemCount: state.gifs.length,
          );
        } else if (state is GifErrorState) {
          return Center(
            child: Text(state.error.toString()),
          );
        } else {
          return Center(
            child: Text('Unknown State'),
          );
        }
      },
    );
  }
}
