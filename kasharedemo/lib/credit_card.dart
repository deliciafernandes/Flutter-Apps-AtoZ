import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCard extends StatefulWidget {
  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  String cardNumber = '4040 4040';
  String expiryDate = '5/20';
  String cardHolderName = 'Delicia Fernandes';
  String cvvCode = '777';
  bool isCvvFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            //true when you want to show cvv(back) view
//        cardbgColor: Colors.black,
            height: 250,
//      textStyle: TextStyle(color: Colors.yellowAccent),
            width: MediaQuery.of(context).size.width,
            animationDuration: Duration(milliseconds: 1000),
          ),
        ),
      ),
    );
  }
}
