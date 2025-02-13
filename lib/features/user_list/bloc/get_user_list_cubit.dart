import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:suitmedia_test_mobile_flutter/data/models/user_entity.dart';
import 'package:suitmedia_test_mobile_flutter/data/repositories/user_repository.dart';

class GetUserListCubit extends Cubit<PagingController<int, UserEntity>> {
  static const _pageSize = 10;

  GetUserListCubit() : super(PagingController(firstPageKey: 0)) {
    state.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final repository = GetIt.I<UserRepository>();
      final newItems =
          await repository.getListUser(pageKey: pageKey, pageSize: _pageSize);

      if (newItems != null) {
        final isLastPage = newItems.length < _pageSize;
        if (isLastPage) {
          state.appendLastPage(newItems);
        } else {
          final nextPageKey = pageKey + newItems.length;
          state.appendPage(newItems, nextPageKey);
        }
      }
    } catch (error) {
      state.error = error;
    }
  }

  void refreshList() {
    state.refresh();
    _fetchPage(0);
  }
}
