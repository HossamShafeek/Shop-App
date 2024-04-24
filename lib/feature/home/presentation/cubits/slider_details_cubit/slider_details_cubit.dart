import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/feature/home/presentation/cubits/slider_details_cubit/slider_details_state.dart';

class SliderDetailsCubit extends Cubit<SliderDetailsState>{
  SliderDetailsCubit():super(SliderDetailsInitialState());

  static SliderDetailsCubit get(BuildContext context)=>BlocProvider.of(context);

  int currentIndex = 0;

  void changeSliderIndex({required int index}){
    currentIndex = index;
    emit(ChangeSliderIndexState());
  }
}