import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:suitmedia_test_mobile_flutter/data/models/user_entity.dart';
import 'package:suitmedia_test_mobile_flutter/features/user_list/bloc/get_user_list_cubit.dart';
import 'package:suitmedia_test_mobile_flutter/features/user_list/widgets/empty_state.dart';
import 'package:suitmedia_test_mobile_flutter/features/user_list/widgets/error_state.dart';
import 'package:suitmedia_test_mobile_flutter/features/user_list/widgets/user_card.dart';
import 'package:suitmedia_test_mobile_flutter/global_widget.dart/custom_app_bar.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Third Screen",
      ),
      body: BlocBuilder<GetUserListCubit, PagingController<int, UserEntity>>(
        builder: (context, pagingController) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<GetUserListCubit>().refreshList();
            },
            child: PagedListView(
              pagingController: pagingController,
              builderDelegate: PagedChildBuilderDelegate<UserEntity>(
                itemBuilder: (context, item, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 20,
                  ),
                  child: UserCard(item: item),
                ),
                noItemsFoundIndicatorBuilder: (context) => const EmptyState(),
                firstPageErrorIndicatorBuilder: (context) => ErrorState(
                  onRetry: () => context.read<GetUserListCubit>().refreshList(),
                ),
                newPageErrorIndicatorBuilder: (context) => ErrorState(
                  onRetry: () => pagingController.retryLastFailedRequest(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
