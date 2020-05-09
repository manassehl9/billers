import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/screens/register/confirm_pin/confirm_pin.dart';
import 'package:payment_app/screens/register/pin/pin.dart';
import 'package:payment_app/resources/user_repository.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class RegisterPin extends StatefulWidget {
  final UserRepository _userRepository;
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String gender;
  final String streetAddress;
  final String city;
  final String state;

  RegisterPin(
      {Key key,
      @required UserRepository userRepository,
      @required this.firstName,
      @required this.lastName,
      @required this.dateOfBirth,
      @required this.gender,
      @required this.streetAddress,
      @required this.city,
      @required this.state})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);
  State<RegisterPin> createState() => _RegisterPinState();
}

class _RegisterPinState extends State<RegisterPin> {
  RegisterPinBloc _registerPinBloc;
  var onTapRecognizer;

  TextEditingController _pinController = TextEditingController();
  bool autoDisposeControllers = false;

  StreamController<ErrorAnimationType> pinErrorController;

  bool pinHasError = false;
  String currentText = "";

  bool get isPopulated => _pinController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterPinState state) {
    return state.isFormValid && isPopulated;
  }

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    pinErrorController = StreamController<ErrorAnimationType>();
    super.initState();
    _registerPinBloc = BlocProvider.of<RegisterPinBloc>(context);
    _pinController.addListener(_onPinChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterPinBloc, RegisterPinState>(
      listener: (context, state) {},
      child: BlocBuilder<RegisterPinBloc, RegisterPinState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 30),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    child: FlareActor(
                      "assets/otp.flr",
                      animation: "otp",
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.center,
                    ),
                  ),
                  // Image.asset(
                  //   'assets/verify.png',
                  //   height: MediaQuery.of(context).size.height / 3,
                  //   fit: BoxFit.fitHeight,
                  // ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Secure your account',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 8),
                    child: RichText(
                      text: TextSpan(
                          text: "Enter your ",
                          children: [
                            TextSpan(
                                text: 'PIN CODE',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                          ],
                          style:
                              TextStyle(color: Colors.black54, fontSize: 15)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 30),
                      child: PinCodeTextField(
                        autoDisposeControllers: false,
                        length: 6,
                        obsecureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.white,
                        ),
                        animationDuration: Duration(milliseconds: 300),
                        backgroundColor: Colors.blue.shade50,
                        enableActiveFill: true,
                        errorAnimationController: pinErrorController,
                        controller: _pinController,
                        onCompleted: (v) {
                          print("Completed");
                        },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      pinHasError
                          ? "*Please fill up all the cells properly"
                          : "",
                      style:
                          TextStyle(color: Colors.red.shade300, fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  SizedBox(
                    height: 14,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 30),
                    child: ButtonTheme(
                      height: 50,
                      child: FlatButton(
                        onPressed: () {
                          // conditions for validating
                          if (currentText.length != 6) {
                            pinErrorController.add(ErrorAnimationType
                                .shake); // Triggering error shake animation
                            setState(() {
                              pinHasError = true;
                            });
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterConfirmPinScreen(
                                    userRepository: widget._userRepository,
                                    firstName: widget.firstName,
                                    lastName: widget.lastName,
                                    dateOfBirth: widget.dateOfBirth,
                                    gender: widget.gender,
                                    streetAddress: widget.streetAddress,
                                    city: widget.city,
                                    state: widget.state,
                                    pin: _pinController.text),
                              ),
                            );
                          }
                        },
                        child: Center(
                            child: Text(
                          "Next",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey.shade200,
                            offset: Offset(2, 4),
                            blurRadius: 5,
                            spreadRadius: 2)
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xfffbb448), Color(0xfff7892b)],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
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
    _pinController.dispose();

    super.dispose();
  }

  void _onPinChanged() {
    _registerPinBloc.add(
      PinChanged(pin: _pinController.text),
    );
  }
}
