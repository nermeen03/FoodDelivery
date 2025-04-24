import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../storage/shared_preference.dart';

part 'auth_check_state.dart';

class AuthCheckCubit extends Cubit<AuthCheckState> {
  AuthCheckCubit() : super(AuthCheckInitial());

  Future<void> checkAuth() async {
    var auth = await SharedPreference.getShared();
    if(auth){
      emit(Authenticated());
    }else{
      emit(UnAuthenticated());
    }
  }
}
