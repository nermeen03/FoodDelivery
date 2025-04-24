import '../../models/api_response_model.dart';
import 'network_service.dart';

class ApiRepository{
  Future<ApiResponse> fetchData({required String path, String? category,String? mealId}) async {
    return await MealsService.fetchData(path:path,category: category,mealId: mealId);
  }
}