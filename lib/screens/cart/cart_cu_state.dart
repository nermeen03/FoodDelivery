part of 'cart_cu_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class CartLoad extends CartState {}
final class CartSuccess extends CartState {
  List<MealModel> favMeals;
  CartSuccess(this.favMeals);

}
final class CartFail extends CartState {
  String error;
  CartFail(this.error);
}
