part of 'home_screen_cubit.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}
final class HomeScreenLoading extends HomeScreenState {}
final class HomeScreenListLoading extends HomeScreenState {}

final class HomeScreenListLoaded extends HomeScreenState {
  CategoryListModel categoriesList;
  CategoriesModel? categoriesModel;
  HomeScreenListLoaded({this.categoriesModel,required this.categoriesList}):super();
}
final class HomeScreenLoaded extends HomeScreenState {
  CategoriesModel? categoriesModel;
  HomeScreenLoaded(this.categoriesModel):super();
}
final class HomeScreenFailed extends HomeScreenState {
  String message;
  HomeScreenFailed(this.message);
}
