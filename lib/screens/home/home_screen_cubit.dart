import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/api_response_model.dart';
import '../../models/categories_model.dart';
import '../../models/category_list_model.dart';
import '../../utils/services/api_end_point.dart';
import '../../utils/services/api_repo.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {

  ApiRepository apiRepository;
  HomeScreenCubit(this.apiRepository) : super(HomeScreenInitial());
  bool flag = false;
  Future<void> fetchData() async {
    loadCategories();
  }
  void loadCategories() async {
    flag = false;
    emit(HomeScreenLoading());
    try {
      final response = await apiRepository.fetchData(path: ApiEndPoint.categories);
      if (response.success) {
        CategoriesModel model = CategoriesModel.fromJson(response.data);
        if (model.categories != null) {
          print("done");
          loadCategoryList(categoryName: model.categories![0].strCategory!,cateory: model);
        } else {
          emit(HomeScreenFailed("null result"));
        }
      } else {
        emit(HomeScreenFailed(response.message ?? "Unknown error"));
      }
    } catch (e) {
      emit(HomeScreenFailed(e.toString()));
    }
  }

  void loadCategoryList({required String categoryName,CategoriesModel? cateory}) async {
    flag = true;
    try {
      var response = await apiRepository.fetchData(path: ApiEndPoint.categoryList, category: categoryName);
      if (response.success) {
        final model = CategoryListModel.fromJson(response.data);
        if (model.meals != null) {
          emit(HomeScreenListLoaded(categoriesList: model,categoriesModel: cateory));
        } else {
          emit(HomeScreenFailed("null result"));
        }
      } else {
        emit(HomeScreenFailed(response.message ?? "Unknown error"));
      }
    } catch (e) {
      emit(HomeScreenFailed(e.toString()));
    }
  }

}
