import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/data/repository/giphy_repository.dart';

import '../../../data/model/GifResponse.dart';

abstract class GifState {}

class GifInitialState extends GifState {}

class GifLoadingState extends GifState {}

class GifLoadedState extends GifState {
  final List<Data> gifs;

  GifLoadedState({required this.gifs});
}

class GifErrorState extends GifState {
  final error;

  GifErrorState({required this.error});
}

class GifCubit extends Cubit<GifState> {
  final GiphyRepository gifRepository;
  
  GifCubit() : gifRepository = GiphyRepository(), super(GifInitialState());

  void fetchTrendingGifs(int offset) async {
    if(state is GifLoadingState) return;

    try {
      emit(GifLoadingState());
      final gifs = await gifRepository.fetchTrendingGifs(offset);
      emit(GifLoadedState(gifs: gifs));
    } catch (e) {
      emit(GifErrorState(error: 'Failed to load Gifs'));
    }
  }

  void searchGifs(String query, int offset) async {
    if(state is GifLoadingState) return;

    try {
      emit(GifLoadingState());
      final gifs = await gifRepository.searchGifs(query, offset);
      emit(GifLoadedState(gifs: gifs));
    } catch (e) {
      emit(GifErrorState(error: 'Failed to load Gifs'));
    }
  }
}



