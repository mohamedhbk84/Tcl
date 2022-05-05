


abstract class AppStates {}
class AppInitialStates extends AppStates{}
class AppGetCategoryLoadingState extends AppStates{}
class AppGetCategorySuccessState extends AppStates{}
class AppGetCategoryErrorState extends AppStates{
  final String error;

  AppGetCategoryErrorState(this.error);
}
class AppGetSubCategoryLoadingState extends AppStates{}
class AppGetSubCategorySuccessState extends AppStates{}
class AppGetSubCategoryErrorState extends AppStates{
  final String error;

  AppGetSubCategoryErrorState(this.error);
}



class AppChangeBottonNavBarState extends AppStates{}
class AppAddPostNavBarState extends AppStates{}


class AppGetProductLoadingState extends AppStates{}
class AppGetProductSuccessState extends AppStates{}
class AppGetProductErrorState extends AppStates{
  final String error;

  AppGetProductErrorState(this.error);
}
class AppChangeListInquiryState extends AppStates {}


class postInquiryLoadingState extends AppStates{}
class postInquirySuccessState extends AppStates{}
class postInquiryErrorState extends AppStates{}
class GetOnBoardingLoadingState extends AppStates{}
class GetOnBoardingSuccessState extends AppStates{}
class GetOnBoardingErrorState extends AppStates{}
