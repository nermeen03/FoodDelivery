import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/meal_model.dart';
import '../../storage/cart_database.dart';

part 'cart_cu_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Future<void> fetchFavMeals() async {
    emit(CartLoad());
    var result =  await CartDBHelper().getAll();
    emit(CartSuccess(result));
  }

  Future<void> delete(String id) async {
    await CartDBHelper().delete(id);
    var result =  await CartDBHelper().getAll();
    emit(CartSuccess(result));
  }



}
