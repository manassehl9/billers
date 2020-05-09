import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback _onPressed;
  final String buttonName;

  Button({Key key, VoidCallback onPressed, @required this.buttonName})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onPressed,
      child: _onPressed != null
          ? Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
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
                      colors: [Color(0xfffbb448), Color(0xfff7892b)])),
              child: Text(
                buttonName,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
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
                    colors: [
                      Color(0xfffbb448).withOpacity(0.4),
                      Color(0xfff7892b).withOpacity(0.2)
                    ]),
              ),
              child: Text(
                buttonName,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
    );
  }
}
