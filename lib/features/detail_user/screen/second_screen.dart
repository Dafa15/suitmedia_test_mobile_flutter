import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_test_mobile_flutter/app_routes.dart';
import 'package:suitmedia_test_mobile_flutter/data/models/user_entity.dart';
import 'package:suitmedia_test_mobile_flutter/features/detail_user/widgets/user_profile.dart';
import 'package:suitmedia_test_mobile_flutter/features/user_list/bloc/selected_user_cubit.dart';
import 'package:suitmedia_test_mobile_flutter/global_widget.dart/custom_app_bar.dart';
import 'package:suitmedia_test_mobile_flutter/global_widget.dart/custom_button.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Second Screen",
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const UserProfile(),
            BlocBuilder<SelectedUserCubit, UserEntity>(
              builder: (context, state) {
                return Center(
                  child: Text(
                    state.firstName == null
                        ? "Selected User Name"
                        : "${state.firstName} ${state.lastName}",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                );
              },
            ),
            CustomButton(
              text: "Choose a User",
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.thirdScreen,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
