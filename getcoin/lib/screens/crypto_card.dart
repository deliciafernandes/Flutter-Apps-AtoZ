import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  final String cryptoType;
  final String bitcoinValue;
  final String currencyType;

  CryptoCard({
    @required this.cryptoType,
    @required this.bitcoinValue,
    @required this.currencyType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.blueGrey[800],
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoType = $bitcoinValue $currencyType',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
