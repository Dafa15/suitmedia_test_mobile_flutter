import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_test_mobile_flutter/features/detail_user/bloc/save_user_name_cubit.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Welcome",
        ),
        BlocBuilder<SaveUserNameCubit, String>(
          builder: (context, state) {
            return Text(context.watch<SaveUserNameCubit>().state,
                style: Theme.of(context).textTheme.headlineMedium);
          },
        ),
      ],
    );
  }
}
