import 'package:shop/feature/home/data/models/banner_model/banner_model.dart';

abstract class BannersState {}

final class BannersInitialState extends BannersState {}

class BannersLoadingState extends BannersState {}

class BannersSuccessState extends BannersState {
  final List<BannerModel> banners;

  BannersSuccessState(this.banners);
}

class BannersFailureState extends BannersState {
  final String error;

  BannersFailureState(this.error);
}
