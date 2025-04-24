import 'categories_model.dart';
import 'category_list_model.dart';

class HomeState {
  CategoryListModel? categoriesList;
  CategoriesModel? categoriesModel;
  bool isLoading;

  HomeState({
    this.categoriesModel,
    this.categoriesList,
    this.isLoading = false,
  });

  HomeState copyWith({
    CategoryListModel? categoriesList,
    CategoriesModel? categoriesModel,
    bool? isLoading,
  }) {
    return HomeState(
      categoriesList: categoriesList ?? this.categoriesList,
      categoriesModel: categoriesModel ?? this.categoriesModel,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
