import 'package:flutter_bloc/flutter_bloc.dart';

class SaveUserNameCubit extends Cubit<String> {
  SaveUserNameCubit() : super("");

  void saveUserName({required String userName}) {
    emit(userName);
  }
}
