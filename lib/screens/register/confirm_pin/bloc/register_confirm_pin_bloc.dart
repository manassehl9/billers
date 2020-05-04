import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:payment_app/screens/register/confirm_pin/bloc/bloc.dart';
import 'package:payment_app/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegisterConfirmPinBloc
    extends Bloc<RegisterConfirmPinEvent, RegisterConfirmPinState> {

  @override
  RegisterConfirmPinState get initialState => RegisterConfirmPinState.empty();

  @override
  Stream<Transition<RegisterConfirmPinEvent, RegisterConfirmPinState>>
      transformEvents(
    Stream<RegisterConfirmPinEvent> events,
    TransitionFunction<RegisterConfirmPinEvent, RegisterConfirmPinState>
        transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! ConfirmPinChanged);
    });
    final debounceStream = events.where((event) {
      return (event is ConfirmPinChanged);
    }).debounceTime(Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<RegisterConfirmPinState> mapEventToState(
    RegisterConfirmPinEvent event,
  ) async* {
    if (event is ConfirmPinChanged) {
      yield* _mapConfirmPinChangedToState(event.pin);
    }
  }

  Stream<RegisterConfirmPinState> _mapConfirmPinChangedToState(
      String pin) async* {
    yield state.update(
      isPinValid: Validators.isValidPin(pin),
    );
  }
}
