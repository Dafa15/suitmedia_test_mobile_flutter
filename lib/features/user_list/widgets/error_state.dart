import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:suitmedia_test_mobile_flutter/global_widget.dart/custom_button.dart';

class ErrorState extends StatelessWidget {
  final VoidCallback onRetry;

  const ErrorState({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 50),
          const Gap(10),
          const Text(
            "Failed to load data",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          CustomButton(
            text: "Retry",
            width: 100,
            onPressed: onRetry,
          )
        ],
      ),
    );
  }
}
