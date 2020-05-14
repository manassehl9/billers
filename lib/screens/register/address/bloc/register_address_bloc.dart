import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:payment_app/screens/register/address/bloc/bloc.dart';
import 'package:payment_app/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegisterAddressBloc
    extends Bloc<RegisterAddressEvent, RegisterAddressState> {
  @override
  RegisterAddressState get initialState => RegisterAddressState.empty();

  @override
  Stream<Transition<RegisterAddressEvent, RegisterAddressState>>
      transformEvents(
    Stream<RegisterAddressEvent> events,
    TransitionFunction<RegisterAddressEvent, RegisterAddressState> transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! StreetAddressChanged &&
          event is! CityChanged &&
          event is! StateChanged);
    });
    final debounceStream = events.where((event) {
      return (event is StreetAddressChanged ||
          event is CityChanged ||
          event is StateChanged);
    }).debounceTime(Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<RegisterAddressState> mapEventToState(
    RegisterAddressEvent event,
  ) async* {
    if (event is StreetAddressChanged) {
      yield* _mapStreetAddressChangedToState(event.streetAddress);
    } else if (event is CityChanged) {
      yield* _mapCityChangedToState(event.city);
    } else if (event is StateChanged) {
      yield* _mapStateChangedToState(event.state);
    }
  }

  Stream<RegisterAddressState> _mapStreetAddressChangedToState(
      String streetAddress) async* {
    if (streetAddress.length > 0) {
      yield state.update(
        isStreetAddressValid: Validators.isValidString(streetAddress),
      );
    }
  }

  Stream<RegisterAddressState> _mapCityChangedToState(String city) async* {
    if (city.length > 0) {
      yield state.update(
        isCityValid: Validators.isValidString(city),
      );
    }
  }

  Stream<RegisterAddressState> _mapStateChangedToState(String states) async* {
    if (states.length > 0) {
      yield state.update(
        isStateValid: Validators.isValidString(states),
      );
    }
  }
}
