import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/screens/register/confirm_pin/confirm_pin.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class RegisterConfirmPin extends StatefulWidget {
  State<RegisterConfirmPin> createState() => _RegisterConfirmPinState();
}

class _RegisterConfirmPinState extends State<RegisterConfirmPin> {
  RegisterConfirmPinBloc _registerConfirmPinBloc;
  var onTapRecognizer;

  TextEditingController _pinController = TextEditingController();

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool get isPopulated => _pinController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterConfirmPinState state) {
    return state.isFormValid && isPopulated;
  }

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
    _registerConfirmPinBloc = BlocProvider.of<RegisterConfirmPinBloc>(context);
    _pinController.addListener(_onConfirmPinChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterConfirmPinBloc, RegisterConfirmPinState>(
      listener: (context, state) {},
      child: BlocBuilder<RegisterConfirmPinBloc, RegisterConfirmPinState>(
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
                  // Container(
                  //   height: MediaQuery.of(context).size.height / 3,
                  //   child: FlareActor(
                  //     "assets/otp.flr",
                  //     animation: "otp",
                  //     fit: BoxFit.fitHeight,
                  //     alignment: Alignment.center,
                  //   ),
                  // ),
                  Image.asset(
                    'assets/verify.png',
                    height: MediaQuery.of(context).size.height / 3,
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Pin Confirmation',
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
                          text: "Enter your pin code ",
                          children: [
                            TextSpan(
                                text: 'AGAIN',
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
                        errorAnimationController: errorController,
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
                      hasError ? "*Please fill up all the cells properly" : "",
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
                            errorController.add(ErrorAnimationType
                                .shake); // Triggering error shake animation
                            setState(() {
                              hasError = true;
                            });
                          } else {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => RegisterConfirmPinScreen(),
                            //   ),
                            // );
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

  void _onConfirmPinChanged() {
    _registerConfirmPinBloc.add(
      ConfirmPinChanged(pin: _pinController.text),
    );
  }
}
