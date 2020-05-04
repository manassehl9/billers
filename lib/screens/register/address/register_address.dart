import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/screens/register/address/bloc/bloc.dart';
import 'package:payment_app/screens/register/address/register_address_button.dart';
import 'package:payment_app/screens/register/pin/register_pin_screen.dart';
import 'package:payment_app/user_repository.dart';

class RegisterAddress extends StatefulWidget {
  final UserRepository _userRepository;

  RegisterAddress({Key key, @required UserRepository userRepository})
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
                  RegisterAddressButton(
                    onPressed: isRegisterButtonEnabled(state)
                        ? () {
                            //pass in the details of firstname and last name
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPinScreen(userRepository: widget._userRepository,),
                              ),
                            );
                          }
                        : null,
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
    _registerAddressBloc.add(
      Submitted(
          streetAddress: _streetAddressController.text,
          city: _cityController.text,
          state: _stateController.text),
    );
  }
}
