import 'package:meta/meta.dart';

@immutable
class RegisterNameState {
  final bool isFirstNameValid;
  final bool isLastNameValid;

  bool get isFormValid => isFirstNameValid && isLastNameValid;

  RegisterNameState({
    @required this.isFirstNameValid,
    @required this.isLastNameValid,
  });

  factory RegisterNameState.empty() {
    return RegisterNameState(
      isFirstNameValid: true,
      isLastNameValid: true,
    );
  }

  factory RegisterNameState.loading() {
    return RegisterNameState(
      isFirstNameValid: true,
      isLastNameValid: true,
    );
  }

  factory RegisterNameState.failure() {
    return RegisterNameState(
      isFirstNameValid: true,
      isLastNameValid: true,
    );
  }

  factory RegisterNameState.success() {
    return RegisterNameState(
      isFirstNameValid: true,
      isLastNameValid: true,
    );
  }

  RegisterNameState update({
    bool isFirstNameValid,
    bool isLastNameValid,
  }) {
    return copyWith(
      isFirstNameValid: isFirstNameValid,
      isLastNameValid: isLastNameValid,
    );
  }

  RegisterNameState copyWith({
    bool isFirstNameValid,
    bool isLastNameValid,
    bool isSubmitEnabled,
  }) {
    return RegisterNameState(
      isFirstNameValid: isFirstNameValid ?? this.isFirstNameValid,
      isLastNameValid: isLastNameValid ?? this.isLastNameValid,
    );
  }

  @override
  String toString() {
    return '''RegisterNameState {
      isFirstNameValid: $isFirstNameValid,
      isLastNameValid: $isLastNameValid,
    }''';
  }
}
