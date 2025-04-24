import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/api_response_model.dart';
import '../../models/categories_model.dart';
import '../../models/category_list_model.dart';
import '../../models/home_state.dart';
import '../../utils/services/api_end_point.dart';
import '../../utils/services/api_repo.dart';


class HomeScreenCubitCopy extends Cubit<HomeState> {

  ApiRepository apiRepository;
  HomeScreenCubitCopy(this.apiRepository) : super(HomeState());
  bool flag = false;
  Future<void> fetchData() async {
    loadCategories();
  }
  void loadCategories() async {
    flag = false;
    emit(state.copyWith(isLoading: true));
    try {
      final response = await apiRepository.fetchData(path: ApiEndPoint.categories);
      if (response.success) {
        CategoriesModel model = CategoriesModel.fromJson(response.data);
        if (model.categories != null) {
          print("done");
          emit(state.copyWith(categoriesModel: model));

          // loadCategoryList(categoryName: model.categories![0].strCategory!,cateory: model);
        } else {
          // emit(HomeScreenFailed("null result"));
        }
      } else {
        // emit(HomeScreenFailed(response.message ?? "Unknown error"));
      }
    } catch (e) {
      // emit(HomeScreenFailed(e.toString()));
    }
    emit(state.copyWith(isLoading: false));

  }

  void loadCategoryList({required String categoryName,CategoriesModel? cateory}) async {
    flag = true;
    emit(state.copyWith(isLoading: true));
    try {
      var response = await apiRepository.fetchData(path: ApiEndPoint.categoryList, category: categoryName);
      if (response.success) {
        final model = CategoryListModel.fromJson(response.data);
        if (model.meals != null) {
          emit(state.copyWith(categoriesList: model));
        } else {
          // emit(HomeScreenFailed("null result"));
        }
      } else {
        // emit(HomeScreenFailed(response.message ?? "Unknown error"));
      }
    } catch (e) {
      // emit(HomeScreenFailed(e.toString()));
    }
    emit(state.copyWith(isLoading: false));

  }

}
