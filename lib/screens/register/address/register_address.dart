import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/resources/user_repository.dart';
import 'package:payment_app/screens/register/address/bloc/bloc.dart';
import 'package:payment_app/screens/register/pin/register_pin_screen.dart';
import 'package:payment_app/widgets/button.dart';

class RegisterAddress extends StatefulWidget {
  final UserRepository _userRepository;
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String gender;

  RegisterAddress(
      {Key key,
      @required UserRepository userRepository,
      @required this.firstName,
      @required this.lastName,
      @required this.dateOfBirth,
      @required this.gender})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  State<RegisterAddress> createState() => _RegisterAddressState();
}

class _RegisterAddressState extends State<RegisterAddress> {
  final TextEditingController _streetAddressController =
      TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();

  RegisterAddressBloc _registerAddressBloc;

  bool get isPopulated =>
      _streetAddressController.text.isNotEmpty &&
      _cityController.text.isNotEmpty &&
      _stateController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterAddressState state) {
    return state.isFormValid && isPopulated;
  }

  @override
  void initState() {
    super.initState();

    _registerAddressBloc = BlocProvider.of<RegisterAddressBloc>(context);
    _streetAddressController.addListener(_onStreetAddressChanged);
    _cityController.addListener(_onCityChanged);
    _stateController.addListener(_onStateChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterAddressBloc, RegisterAddressState>(
      listener: (context, state) {},
      child: BlocBuilder<RegisterAddressBloc, RegisterAddressState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              child: ListView(
                children: <Widget>[
                  Text('Where do you live?',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Please, use your actual house address.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Address',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _streetAddressController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xfff3f3f4),
                        filled: true),
                    keyboardType: TextInputType.text,
                    autovalidate: true,
                    autocorrect: false,
                    validator: (_) {
                      return !state.isStreetAddressValid
                          ? 'Street Address Cannot be empty'
                          : null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'City',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _cityController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xfff3f3f4),
                        filled: true),
                    keyboardType: TextInputType.text,
                    autovalidate: true,
                    autocorrect: false,
                    validator: (_) {
                      return !state.isCityValid ? 'City Cannot be empty' : null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'State',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _stateController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color(0xfff3f3f4),
                        filled: true),
                    keyboardType: TextInputType.text,
                    autovalidate: true,
                    autocorrect: false,
                    validator: (_) {
                      return !state.isStateValid
                          ? 'State Cannot be empty'
                          : null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Button(
                    onPressed: isRegisterButtonEnabled(state)
                        ? _onFormSubmitted
                        : null,
                    buttonName: 'Next',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _streetAddressController.dispose();
    _cityController.dispose();
    _stateController.dispose();

    super.dispose();
  }

  void _onStreetAddressChanged() {
    _registerAddressBloc.add(
      StreetAddressChanged(streetAddress: _streetAddressController.text),
    );
  }

  void _onCityChanged() {
    _registerAddressBloc.add(
      CityChanged(city: _cityController.text),
    );
  }

  void _onStateChanged() {
    _registerAddressBloc.add(
      StateChanged(state: _stateController.text),
    );
  }

  void _onFormSubmitted() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterPinScreen(
            userRepository: widget._userRepository,
            firstName: widget.firstName,
            lastName: widget.lastName,
            dateOfBirth: widget.dateOfBirth,
            gender: widget.gender,
            streetAddress: _streetAddressController.text,
            city: _cityController.text,
            state: _stateController.text),
      ),
    );
  }
}
