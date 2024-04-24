import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/core/errors/failures.dart';
import 'package:shop/feature/home/data/models/categories_model/categories_model.dart';
import 'package:shop/feature/home/data/repository/home_repository.dart';
import 'package:shop/feature/home/presentation/cubits/categories_cubit/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepository) : super(CategoriesInitial());
  final HomeRepository homeRepository;

  static CategoriesCubit get(context) => BlocProvider.of(context);

  Future<void> getCategories() async {
    emit(CategoriesLoadingState());
    Either<Failure, List<CategoryModel>> result;
    result = await homeRepository.getCategories();
    result.fold((failure) {
      emit(CategoriesFailureState(failure.error));
    }, (categories) {
      emit(CategoriesSuccessState(categories));
    });
  }
}
