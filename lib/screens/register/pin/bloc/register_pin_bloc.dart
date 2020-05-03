import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:payment_app/screens/register/pin/bloc/bloc.dart';
import 'package:payment_app/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegisterPinBloc extends Bloc<RegisterPinEvent, RegisterPinState> {
  @override
  RegisterPinState get initialState => RegisterPinState.empty();

  @override
  Stream<Transition<RegisterPinEvent, RegisterPinState>> transformEvents(
    Stream<RegisterPinEvent> events,
    TransitionFunction<RegisterPinEvent, RegisterPinState> transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! PinChanged);
    });
    final debounceStream = events.where((event) {
      return (event is PinChanged);
    }).debounceTime(Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<RegisterPinState> mapEventToState(
    RegisterPinEvent event,
  ) async* {
    if (event is PinChanged) {
      yield* _mapPinChangedToState(event.pin);
    }
  }

  Stream<RegisterPinState> _mapPinChangedToState(String pin) async* {
    yield state.update(
      isPinValid: Validators.isValidPin(pin),
    );
  }
}
