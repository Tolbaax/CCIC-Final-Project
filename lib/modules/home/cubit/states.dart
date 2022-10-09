abstract class ProductStates {}

class ProductInitialState extends ProductStates {}

class ProductLoadingState extends ProductStates {}

class ProductSuccessState extends ProductStates {}

class ProductErrorState extends ProductStates {
  final String msg;
  ProductErrorState({required this.msg});
}
