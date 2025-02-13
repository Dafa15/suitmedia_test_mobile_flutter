import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_test_mobile_flutter/core/constant/color_constant.dart';
import 'package:suitmedia_test_mobile_flutter/data/models/user_entity.dart';
import 'package:suitmedia_test_mobile_flutter/features/user_list/bloc/selected_user_cubit.dart';

class UserCard extends StatelessWidget {
  final UserEntity item;
  const UserCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: UnderlineInputBorder(
        borderSide: BorderSide(
          color: ColorConstant.borderColor,
          width: 0.5,
        ),
      ),
      onTap: () {
        context.read<SelectedUserCubit>().saveUser(item);
        Navigator.pop(context);
      },
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(item.avatar ?? ""),
      ),
      title: Text(
        "${item.firstName} ${item.lastName}",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(item.email ?? "---"),
    );
  }
}
