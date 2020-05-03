import 'package:meta/meta.dart';

@immutable
class RegisterBasicState {
  final bool isBankNameValid;
  final bool isAccountNameValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormValid => isBankNameValid && isAccountNameValid;

  RegisterBasicState({
    @required this.isBankNameValid,
    @required this.isAccountNameValid,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
  });

  factory RegisterBasicState.empty() {
    return RegisterBasicState(
      isBankNameValid: true,
      isAccountNameValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory RegisterBasicState.loading() {
    return RegisterBasicState(
      isBankNameValid: true,
      isAccountNameValid: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory RegisterBasicState.failure() {
    return RegisterBasicState(
      isBankNameValid: true,
      isAccountNameValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
    );
  }

  factory RegisterBasicState.success() {
    return RegisterBasicState(
      isBankNameValid: true,
      isAccountNameValid: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
    );
  }

  RegisterBasicState update({
    bool isBankNameValid,
    bool isAccountNameValid,
  }) {
    return copyWith(
      isBankNameValid: isBankNameValid,
      isAccountNameValid: isAccountNameValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  RegisterBasicState copyWith({
    bool isBankNameValid,
    bool isAccountNameValid,
    bool isSubmitEnabled,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return RegisterBasicState(
      isBankNameValid: isBankNameValid ?? this.isBankNameValid,
      isAccountNameValid: isAccountNameValid ?? this.isAccountNameValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  String toString() {
    return '''RegisterState {

     
      isBankNameValid: $isBankNameValid,
      isAccountNameValid: $isAccountNameValid,
      
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
    }''';
  }
}
