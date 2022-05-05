abstract class AdvicesStates {}
class AdvicesInitialStates extends AdvicesStates{}


class AdvicesGetSubTechnicalAdvicesLoadingState extends AdvicesStates{}
class AdvicesGetSubTechnicalAdvicesSuccessState extends AdvicesStates{}
class AdvicesGetSubTechnicalAdvicesErrorState extends AdvicesStates{
  final String error;

  AdvicesGetSubTechnicalAdvicesErrorState(this.error);
}


class AdvicesGetTechnicalAdvicesLoadingState extends AdvicesStates{}
class AdvicesGetTechnicalAdvicesSuccessState extends AdvicesStates{}
class AdvicesGetTechnicalAdvicesErrorState extends AdvicesStates{
  final String error;

  AdvicesGetTechnicalAdvicesErrorState(this.error);
}class AdvicesGetProductsLoadingState extends AdvicesStates{}
class AdvicesGetProductsSuccessState extends AdvicesStates{}
class AdvicesGetProductsErrorState extends AdvicesStates{
  final String error;

  AdvicesGetProductsErrorState(this.error);
}
class AdvicesGetDetailsLoadingState extends AdvicesStates{}
class AdvicesGetDetailsSuccessState extends AdvicesStates{}
class AdvicesGetDetailsErrorState extends AdvicesStates{}


