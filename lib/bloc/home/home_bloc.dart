import 'package:apple_shop/bloc/home/home_event.dart';
import 'package:apple_shop/data/repository/banner_repository.dart';
import 'package:apple_shop/di/di.dart';
import 'package:bloc/bloc.dart';

import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _bannerRepository = locator.get();
  HomeBloc() : super(HomeInitState()) {
    on<HomeGetInitilzeData>((event, emit) async {
      emit(HomeLoadingState());
      var bannerList = await _bannerRepository.getBanners();
      emit(HomeRequestSuccessState(bannerList));
    });
  }
}
