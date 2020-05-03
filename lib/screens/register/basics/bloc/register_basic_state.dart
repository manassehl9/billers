import 'package:meta/meta.dart';

@immutable
class RegisterBasicState {
  final bool isDateOfBirthValid;
  final bool isGenderValid;

  bool get isFormValid => isDateOfBirthValid && isGenderValid;

  RegisterBasicState({
    @required this.isDateOfBirthValid,
    @required this.isGenderValid,
  });

  factory RegisterBasicState.empty() {
    return RegisterBasicState(
      isDateOfBirthValid: true,
      isGenderValid: true,
    );
  }

  factory RegisterBasicState.loading() {
    return RegisterBasicState(
      isDateOfBirthValid: true,
      isGenderValid: true,
    );
  }

  factory RegisterBasicState.failure() {
    return RegisterBasicState(
      isDateOfBirthValid: true,
      isGenderValid: true,
    );
  }

  factory RegisterBasicState.success() {
    return RegisterBasicState(
      isDateOfBirthValid: true,
      isGenderValid: true,
    );
  }

  RegisterBasicState update({
    bool isDateOfBirthValid,
    bool isGenderValid,
  }) {
    return copyWith(
      isDateOfBirthValid: isDateOfBirthValid,
      isGenderValid: isGenderValid,
    );
  }

  RegisterBasicState copyWith({
    bool isDateOfBirthValid,
    bool isGenderValid,
    bool isSubmitEnabled,
  }) {
    return RegisterBasicState(
      isDateOfBirthValid: isDateOfBirthValid ?? this.isDateOfBirthValid,
      isGenderValid: isGenderValid ?? this.isGenderValid,
    );
  }

  @override
  String toString() {
    return '''RegisterState {
      isDateOfBirthValid: $isDateOfBirthValid,
      isGenderValid: $isGenderValid,
    }''';
  }
}
