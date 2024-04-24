import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/errors/failures.dart';
import 'package:shop/feature/home/data/models/banner_model/banner_model.dart';
import 'package:shop/feature/home/data/repository/home_repository.dart';
import 'package:shop/feature/home/presentation/cubits/banners_cubit/banners_state.dart';

class BannersCubit extends Cubit<BannersState> {
  BannersCubit(this.homeRepository) : super(BannersInitialState());
  final HomeRepository homeRepository;

  static BannersCubit get(context) => BlocProvider.of(context);

  Future<void> getBanners() async {
    emit(BannersLoadingState());
    Either<Failure, List<BannerModel>> result;
    result = await homeRepository.getBanners();
    result.fold((failure) {
      emit(BannersFailureState(failure.error));
    }, (banners) {
      emit(BannersSuccessState(banners));
    });
  }
}