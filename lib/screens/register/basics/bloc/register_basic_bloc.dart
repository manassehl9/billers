import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:payment_app/screens/register/basics/bloc/bloc.dart';
import 'package:payment_app/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBasicBloc extends Bloc<RegisterBasicEvent, RegisterBasicState> {
  @override
  RegisterBasicState get initialState => RegisterBasicState.empty();

  @override
  Stream<Transition<RegisterBasicEvent, RegisterBasicState>> transformEvents(
    Stream<RegisterBasicEvent> events,
    TransitionFunction<RegisterBasicEvent, RegisterBasicState> transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! DateOfBirthChanged && event is! GenderChanged);
    });
    final debounceStream = events.where((event) {
      return (event is DateOfBirthChanged || event is GenderChanged);
    }).debounceTime(Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<RegisterBasicState> mapEventToState(
    RegisterBasicEvent event,
  ) async* {
    if (event is DateOfBirthChanged) {
      yield* _mapDateOfBirthChangedToState(event.dateOfBirth);
    } else if (event is GenderChanged) {
      yield* _mapGenderChangedToState(event.gender);
    }
  }

  Stream<RegisterBasicState> _mapDateOfBirthChangedToState(
      String dateOfBirth) async* {
    yield state.update(
      isDateOfBirthValid: Validators.isValidDateOfBirth(dateOfBirth),
    );
  }

  Stream<RegisterBasicState> _mapGenderChangedToState(String gender) async* {
    yield state.update(
      isGenderValid: Validators.isValidGender(gender),
    );
  }
}
