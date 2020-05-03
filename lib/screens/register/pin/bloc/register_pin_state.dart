import 'package:meta/meta.dart';

@immutable
class RegisterPinState {
  final bool isPinValid;

  bool get isFormValid => isPinValid;

  RegisterPinState({
    @required this.isPinValid,
  });

  factory RegisterPinState.empty() {
    return RegisterPinState(isPinValid: true);
  }

  factory RegisterPinState.loading() {
    return RegisterPinState(isPinValid: true);
  }

  factory RegisterPinState.failure() {
    return RegisterPinState(isPinValid: true);
  }

  factory RegisterPinState.success() {
    return RegisterPinState(isPinValid: true);
  }

  RegisterPinState update({
    bool isPinValid,
  }) {
    return copyWith(
      isPinValid: isPinValid,
    );
  }

  RegisterPinState copyWith({
    bool isPinValid,
    bool isSubmitEnabled,
  }) {
    return RegisterPinState(
      isPinValid: isPinValid ?? this.isPinValid,
    );
  }

  @override
  String toString() {
    return '''RegisterPinState {
      isPinValid: $isPinValid,
    }''';
  }
}
