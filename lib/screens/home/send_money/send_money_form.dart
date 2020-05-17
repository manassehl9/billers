import 'package:flutter/material.dart';
import 'package:payment_app/utils/appTheme.dart';
import 'package:payment_app/widgets/button.dart';

class SendMoneyForm extends StatefulWidget {
  @override
  _SendMoneyFormState createState() => _SendMoneyFormState();
}

class _SendMoneyFormState extends State<SendMoneyForm> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _transactionPinController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Form(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              'Fill the form to send money',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppTheme.getTheme().colorScheme.primary),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Amount',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppTheme.getTheme().colorScheme.primary),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _amountController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true),
              keyboardType: TextInputType.number,
              autovalidate: true,
              autocorrect: false,
              validator: (_) {
                // return !state.isStreetAddressValid
                //     ? 'Street Address Cannot be empty'
                //     : null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Bank Name',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppTheme.getTheme().colorScheme.primary),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _bankNameController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true),
              keyboardType: TextInputType.text,
              autovalidate: true,
              autocorrect: false,
              validator: (_) {
                //    return !state.isCityValid ? 'City Cannot be empty' : null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Account Number',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppTheme.getTheme().colorScheme.primary),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _accountNumberController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true),
              keyboardType: TextInputType.number,
              autovalidate: true,
              autocorrect: false,
              validator: (_) {
                //  return !state.isStateValid ? 'State Cannot be empty' : null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Transaction Pin',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppTheme.getTheme().colorScheme.primary),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _transactionPinController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true),
              keyboardType: TextInputType.number,
              autovalidate: true,
              autocorrect: false,
              validator: (_) {
                //  return !state.isStateValid ? 'State Cannot be empty' : null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Button(
              //  onPressed:
              //   isRegisterButtonEnabled(state) ? _onFormSubmitted : null,
              buttonName: 'Next',
            ),
          ],
        ),
      ),
    );
  }
}
