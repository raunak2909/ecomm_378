abstract class CartState{}

class CartInitialState extends CartState{}
class CartLoadingState extends CartState{}
class CartSuccessState extends CartState{
  List<String>? cartItems;
  CartSuccessState({this.cartItems});
}
class CartFailureState extends CartState{
  String errorMsg;
  CartFailureState({required this.errorMsg});
}