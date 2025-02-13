import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_test_mobile_flutter/features/detail_user/bloc/save_user_name_cubit.dart';
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
            Column(
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
            ),
            Center(
              child: Text(
                "Selected User Name",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            CustomButton(
              text: "Choose a User",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
