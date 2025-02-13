import 'package:flutter_bloc/flutter_bloc.dart';

class PalindromeCubit extends Cubit<String> {
  PalindromeCubit() : super("Palindrome");

  void isPalindrome({required String text}) {
    final cleanedText = text.replaceAll(' ', '').toLowerCase();
    final reversedText = cleanedText.split('').reversed.join('');
    if (cleanedText == reversedText) {
      emit('isPalindrome');
    } else {
      emit('not palindrome');
    }
  }
}
