import 'package:meta/meta.dart';

@immutable
class RegisterConfirmPinState {
  final bool isPinValid;

  bool get isFormValid => isPinValid;

  RegisterConfirmPinState({
    @required this.isPinValid,
  });

  factory RegisterConfirmPinState.empty() {
    return RegisterConfirmPinState(isPinValid: true);
  }

  factory RegisterConfirmPinState.loading() {
    return RegisterConfirmPinState(isPinValid: true);
  }

  factory RegisterConfirmPinState.failure() {
    return RegisterConfirmPinState(isPinValid: true);
  }

  factory RegisterConfirmPinState.success() {
    return RegisterConfirmPinState(isPinValid: true);
  }

  RegisterConfirmPinState update({
    bool isPinValid,
  }) {
    return copyWith(
      isPinValid: isPinValid,
    );
  }

  RegisterConfirmPinState copyWith({
    bool isPinValid,
    bool isSubmitEnabled,
  }) {
    return RegisterConfirmPinState(
      isPinValid: isPinValid ?? this.isPinValid,
    );
  }

  @override
  String toString() {
    return '''RegisterConfirmPinState {
      isPinValid: $isPinValid,
    }''';
  }
}
