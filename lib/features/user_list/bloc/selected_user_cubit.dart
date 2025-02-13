import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_test_mobile_flutter/data/models/user_entity.dart';

class SelectedUserCubit extends Cubit<UserEntity> {
  SelectedUserCubit() : super(UserEntity());

  void saveUser(UserEntity user) {
    emit(user);
  }
}
