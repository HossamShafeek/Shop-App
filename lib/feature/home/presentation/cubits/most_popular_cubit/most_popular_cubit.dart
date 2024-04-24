import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/errors/failures.dart';
import 'package:shop/feature/home/data/models/product_model/product_model.dart';
import 'package:shop/feature/home/data/repository/home_repository.dart';
import 'package:shop/feature/home/presentation/cubits/most_popular_cubit/most_popular_state.dart';

class MostPopularCubit extends Cubit<MostPopularState> {
  MostPopularCubit(this.homeRepository) : super(MostPopularInitial());
  final HomeRepository homeRepository;

  static MostPopularCubit get(context) => BlocProvider.of(context);

  Future<void> getMostPopular() async {
    emit(MostPopularLoadingState());
    Either<Failure, List<ProductModel>> result;
    result = await homeRepository.getMostPopular();
    result.fold((failure) {
      emit(MostPopularFailureState(failure.error));
    }, (products) {
      emit(MostPopularSuccessState(products));
    });
  }
}
